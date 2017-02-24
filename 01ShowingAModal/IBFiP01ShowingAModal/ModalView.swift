//
//  ModalView.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

protocol ModalViewDelegate: class {
    func modalDismissButtonTapped(_ modalView: ModalView)
}

/// A UIView with a blurred background and an AllSetDismissButton in the upper left. Implement ModalViewDelegate in the parent view controller to handle dismissal. The owning view controller should also set its presentation style to .overCurrentContext for the blur to work with a presenting view controller.
final class ModalView: UIView {

    weak var delegate: ModalViewDelegate?

    fileprivate let blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        return UIVisualEffectView(effect: effect)
    }()

    fileprivate let dismissButton = DismissButton()

    init() {
        super.init(frame: CGRect.zero)
        configureActions()
        configureView()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }

    @available(*, unavailable) override init(frame: CGRect) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }
}

// MARK: - Actions
private extension ModalView {

    func configureActions() {
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    }

    @objc func dismissTapped() {
        delegate?.modalDismissButtonTapped(self)
    }
}

// MARK: - View Configuration
private extension ModalView {
    
    enum Constants {
        static let dismissButtonMarginRight = CGFloat(10)
        static let dismissButtonMarginTop = CGFloat(30)
    }

    func configureView() {

        // View Hierarchy
        addSubview(blurView)
        addSubview(dismissButton)

        // Style
        isOpaque = false
        backgroundColor = AppColor.clear

        // Layout

        // blurView shares all edges w/its parent
        blurView.edgeAnchors == edgeAnchors

        // dismissButton is placed at the top right
        dismissButton.topAnchor == topAnchor + Constants.dismissButtonMarginTop
        dismissButton.rightAnchor == rightAnchor - Constants.dismissButtonMarginRight
    }
}
