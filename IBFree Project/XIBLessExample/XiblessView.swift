//
//  XiblessView.swift
//  XIBLessExample
//
//  Created by John Stricker on 7/11/16.

import Anchorage
import UIKit

final class XiblessView: UIView {

    enum ViewStyle {
        case SimpleButton
        case CornerButtons
    }

    private let cornerButtons: [UIButton]?

    private let button: UIButton = UIButton(type: .System)

    init(style: ViewStyle) {

        // Create the corner buttons if the style calls for it
        if style == .CornerButtons {
            var buttonArray = [UIButton]()
            for _ in 0..<Constants.numberOfCornerButtons  {
                buttonArray.append(UIButton(type: .System))
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
        static let cornerButtonBackgroundColor = UIColor.lightGrayColor()
    }

    enum ButtonPositions: Int {
        case UpperLeft  = 0
        case UpperRight = 1
        case LowerLeft  = 2
        case LowerRight = 3
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

        backgroundColor = UIColor.greenColor()
        button.setTitle("This is a centered button without a XIB", forState: .Normal)

        // Layout

        // The button is centered in the view
        button.centerXAnchor == centerXAnchor
        button.centerYAnchor == centerYAnchor
    }

    func configureCornerButtons(buttons: [UIButton]) {

        for (index, button) in buttons.enumerate() {

            // First make sure that the button's index has a position defined for it
            guard let position = ButtonPositions(rawValue: index) else {
                debugPrint("Error: \(index) not defined in ButtonPositions")
                continue
            }

            // View heirarchy

            addSubview(button)

            // Style & Layout

            // Button content and style
            button.setTitle(String(index + 1), forState: .Normal)
            button.backgroundColor = Constants.cornerButtonBackgroundColor

            // Height and width of corner buttons are set by a constant
            button.heightAnchor == Constants.cornerButtonSize.height
            button.widthAnchor == Constants.cornerButtonSize.width

            // Place each button in its appropriate corner
            switch position {
            case .UpperLeft:
                button.leftAnchor == leftAnchor
                button.topAnchor  == topAnchor
            case .UpperRight:
                button.rightAnchor == rightAnchor
                button.topAnchor   == topAnchor
            case .LowerLeft:
                button.leftAnchor   == leftAnchor
                button.bottomAnchor == bottomAnchor
            case .LowerRight:
                button.rightAnchor  == rightAnchor
                button.bottomAnchor == bottomAnchor
            }
        }
    }
}
