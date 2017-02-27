//
//  SimpleMessageModalViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/2/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

/// Displays a large centered text message.
final class SimpleMessageModalViewController: ModalViewController {

    fileprivate let messageLabel: UILabel = {
        let label = UILabel()
        label.font =  AppFont.helvetica.size(50)
        label.numberOfLines = 0
        label.textColor = AppColor.white
        label.textAlignment = .center
       return label
    }()

    init(withText text: String) {
        super.init(nibName: nil, bundle: nil)
        messageLabel.text = text
    }
    
    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init(withText:) instead")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - View Configuration
private extension SimpleMessageModalViewController {
    
    func configureView() {

        // View Hierarchy

        view.addSubview(messageLabel)

        // Layout

        // messageLabel is centered in  the view
        messageLabel.centerAnchors == view.centerAnchors
    }
}
