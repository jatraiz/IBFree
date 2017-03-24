//
//  XiblessView.swift
//  XIBLessExample
//
//  Created by John Stricker on 7/11/16.

import Anchorage
import UIKit

final class XiblessView: UIView {

    enum ViewStyle {
        case simpleButton
        case cornerButtons
    }

    fileprivate let cornerButtons: [UIButton]?

    fileprivate let button: UIButton = UIButton(type: .system)

    init(style: ViewStyle) {

        // Create the corner buttons if the style calls for it
        if style == .cornerButtons {
            var buttonArray = [UIButton]()
            for _ in 0..<Constants.numberOfCornerButtons  {
                buttonArray.append(UIButton(type: .system))
            }
            cornerButtons = buttonArray
        } else {
            cornerButtons = nil
        }

        super.init(frame: CGRect.zero)

        configureView()
    }

    @available(*, unavailable) override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure the view

private extension XiblessView {

    struct Constants {
        static let numberOfCornerButtons = 4
        static let cornerButtonSize = CGSize(width: 60, height: 60)
        static let cornerButtonBackgroundColor = UIColor.lightGray
    }

    enum ButtonPositions: Int {
        case upperLeft  = 0
        case upperRight = 1
        case lowerLeft  = 2
        case lowerRight = 3
    }

    func configureView() {
        configureCenterButton()
        
        if let buttons = cornerButtons {
            configureCornerButtons(buttons)
        }
    }

    func configureCenterButton() {
        // View heirarchy

        addSubview(button)

        // Style

        backgroundColor = UIColor.green
        button.setTitle("This is a centered button without a XIB", for: UIControlState())

        // Layout

        // The button is centered in the view
        button.centerXAnchor == centerXAnchor
        button.centerYAnchor == centerYAnchor
    }

    func configureCornerButtons(_ buttons: [UIButton]) {

        for (index, button) in buttons.enumerated() {

            // First make sure that the button's index has a position defined for it
            guard let position = ButtonPositions(rawValue: index) else {
                debugPrint("Error: \(index) not defined in ButtonPositions")
                continue
            }

            // View heirarchy

            addSubview(button)

            // Style & Layout

            // Button content and style
            button.setTitle(String(index + 1), for: UIControlState())
            button.backgroundColor = Constants.cornerButtonBackgroundColor

            // Height and width of corner buttons are set by a constant
            button.heightAnchor == Constants.cornerButtonSize.height
            button.widthAnchor == Constants.cornerButtonSize.width

            // Place each button in its appropriate corner
            switch position {
            case .upperLeft:
                button.leftAnchor == leftAnchor
                button.topAnchor  == topAnchor
            case .upperRight:
                button.rightAnchor == rightAnchor
                button.topAnchor   == topAnchor
            case .lowerLeft:
                button.leftAnchor   == leftAnchor
                button.bottomAnchor == bottomAnchor
            case .lowerRight:
                button.rightAnchor  == rightAnchor
                button.bottomAnchor == bottomAnchor
            }
        }
    }
}
