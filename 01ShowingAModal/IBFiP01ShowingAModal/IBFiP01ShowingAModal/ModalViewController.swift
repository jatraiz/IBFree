//
//  ModalViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

final class ModalViewController: UIViewController {

    // MARK - var overrides
    override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            return .overCurrentContext
        }
        set {
            print("ignoring setting the modal presentation style, it would kill the blur if its not .overCurrentContext")
        }
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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
