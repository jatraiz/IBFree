//
//  MainViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/30/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

/// This will show the Raizlabs Logo and have a button to present a modal
final class MainViewController: UIViewController {

    /// A container used to center contents, all contents of the view controller should be added as a subview to this view
    fileprivate let containerView = UIView()

    /// An image view containing the Raizlabs Logo
    fileprivate let logoImageView: UIImageView = {
        let logoSize = CGSize(width: 150, height: 150)
        let imageView = UIImageView()

        imageView.image = #imageLiteral(resourceName: "raizlabs-logo")

        imageView.heightAnchor == logoSize.height
        imageView.widthAnchor == logoSize.width

        return imageView
    }()

    /// Button to show modal
    fileprivate let showModalButton = PillButton(title: "Show Me The Modal")
}

// MARK: - View lifecycle
extension MainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .currentContext
        configureActions()
        configureView()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}

// MARK: - Actions
private extension MainViewController {

    func configureActions() {
        showModalButton.addTarget(self, action: #selector(showModalButtonTapped), for: .touchUpInside)
    }

    @objc func showModalButtonTapped() {
        present(SimpleMessageViewController(withText: "HERE\nIS\nTHE\nMODAL!"), animated: true, completion: nil)
    }
}

// MARK: - View Configuration
private extension MainViewController {

    enum Appearance {
        static let logoToButtonSpace = CGFloat(30)
    }

    func configureView() {
        // View Hierarchy
        view?.addSubview(containerView)

        containerView.addSubview(logoImageView)
        containerView.addSubview(showModalButton)

        // Style 
        view?.backgroundColor = UIColor.white

        // Layout

        // The containerView's height is dynamically sized to fit its content (the topAnchor should match the top of the top most item, the bottomAnchor should match the bottom of the bottom most item)
        containerView.horizontalAnchors == view.horizontalAnchors
        containerView.topAnchor == logoImageView.topAnchor
        containerView.bottomAnchor == showModalButton.bottomAnchor
        containerView.centerAnchors == view.centerAnchors

        // The imageview is centered in containerView
        logoImageView.centerXAnchor == containerView.centerXAnchor

        // The button is centered below the logo imageview
        showModalButton.centerXAnchor == logoImageView.centerXAnchor
        showModalButton.topAnchor == logoImageView.bottomAnchor + Appearance.logoToButtonSpace
    }

}
