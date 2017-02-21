//
//  ModalViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

/// A modal with dark blurred background and light UIStatusBar
class ModalViewController: UIViewController {

    // MARK - UIViewController var overrides

    override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            return .overFullScreen
        }
        set {
            print("ModalViewController: ignoring setting the modal presentation style, it would kill the blur if its not .overCurrentContext")
        }
    }

    override var modalPresentationCapturesStatusBarAppearance: Bool {
        get {
            return true
        }
        set {
            print("ModalViewController: ignoring setting the modalPresentationCapturesStatusBarAppearance style, it would not allow this controller to control the status bar")
        }
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - View lifecycle
extension ModalViewController {

    override func loadView() {
        view = ModalView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        (view as? ModalView)?.delegate = self
    }
}

// MARK: - ModalViewDelegate
extension ModalViewController: ModalViewDelegate {
    
    func modalDismissButtonTapped(_ modalView: ModalView) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
