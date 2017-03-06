//
//  ModalViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

/// A modal with dark blurred background, dismiss button, and light UIStatusBar
class ModalViewController: UIViewController {

    fileprivate let blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        return UIVisualEffectView(effect: effect)
    }()

    fileprivate let dismissButton = DismissButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
        configureView()
    }
}

// MARK: - Actions
private extension ModalViewController {

    func configureActions() {
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }

    @objc func dismissButtonTapped() {
        presentingViewController?.dismiss(animated: true, completion: nil)

    }
}

// MARK: - UIViewContoller style overrides
extension ModalViewController {

    /// Modal presentation style is set to .overFullScreen to enable the blur effect
    override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            return .overFullScreen
        }
        set {
            print("\(self): ignoring setting the modal presentation style: this controller is designed to be presented full screen and so should always be .overFullScreen (plus, it would kill the blur if its not .overFullScreen or .overCurrentContext)")
        }
    }

    /// Apple docs state that this value should be ignored when a view controller is presented full screen, but this doesn't appear to be the case, we still need to override it to control the status bar appearance (https://developer.apple.com/reference/uikit/uiviewcontroller/1621453-modalpresentationcapturesstatusb) Open radar here: http://openradar.appspot.com/30870230
    override var modalPresentationCapturesStatusBarAppearance: Bool {
        get {
            return true
        }
        set {
            print("\(self): ignoring setting the modalPresentationCapturesStatusBarAppearance style, it would not allow this controller to control the status bar")
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - View Configuration
private extension ModalViewController {

    enum Constant {
        static let dismissButtonMarginTop = CGFloat(30)
        static let dismissButtonMarginTrailing = CGFloat(10)
    }

    func configureView() {

        // View Hierarchy
        view.addSubview(blurView)
        view.addSubview(dismissButton)

        // Style
        view.backgroundColor = AppColor.clear

        // Layout

        // blurView shares all edges w/its parent
        blurView.edgeAnchors == view.edgeAnchors

        // dismissButton is placed at the top right
        dismissButton.trailingAnchor == view.trailingAnchor - Constant.dismissButtonMarginTrailing
        dismissButton.topAnchor == view.topAnchor + Constant.dismissButtonMarginTop
    }
}

