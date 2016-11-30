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

    fileprivate enum Constants {
        // Layout
        static let logoSize = CGSize(width: 150, height: 150)
        static let logoToButtonSpace = CGFloat(20)
    }

    /// A container used to center contents, all contents of the view controller should be added as a subview to this view
    fileprivate let containerView: UIView = {
        return UIView()
    }()

    /// An image view containing the Raizlabs Logo
    fileprivate let logoImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = #imageLiteral(resourceName: "raizlabs-logo")

        imageView.heightAnchor == Constants.logoSize.height
        imageView.widthAnchor == Constants.logoSize.width

        return imageView
    }()

    /// Button to show modal
    fileprivate let showModalButton: UIButton = {
        let button = UIButton(type: .custom)

        button.setTitleColor(UIColor.AppColors.raizlabsRed, for: .normal)
        button.setTitle("Show me the modal!", for: .normal)

        return button
    }()
}

// MARK: - View lifecycle
extension MainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
}

// MARK: - View Configuration
private extension MainViewController {

    func configureView() {
        // View Hierarchy
        view?.addSubview(containerView)

        containerView.addSubview(logoImageView)
        containerView.addSubview(showModalButton)

        // Style 
        view?.backgroundColor = UIColor.white

        // Layout

        // The containerView's height is dynamically sized to fit its content (the topAnchor should match the top of the top most item, the bottomAnchor should match the bottom of the bottom most item)
        containerView.leftAnchor == view.leftAnchor
        containerView.rightAnchor == view.rightAnchor
        containerView.topAnchor == logoImageView.topAnchor
        containerView.bottomAnchor == showModalButton.bottomAnchor
        containerView.centerAnchors == view.centerAnchors

        // The imageview is centered in containerView
        logoImageView.centerXAnchor == containerView.centerXAnchor

        // The button is centered below the logo imageview
        showModalButton.centerXAnchor == logoImageView.centerXAnchor
        showModalButton.topAnchor == logoImageView.bottomAnchor + Constants.logoToButtonSpace
    }

}
