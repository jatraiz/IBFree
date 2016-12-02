//
//  SimpleMessageModal.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/2/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

final class SimpleMessageViewController: ModalViewController {
    fileprivate let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.App(type: .helvetica, ofSize: 50)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    convenience init(withText text: String) {
        self.init()
        messageLabel.text = text
    }
}

// MARK: - View Lifecycle
extension SimpleMessageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - View Configuration
private extension SimpleMessageViewController {
    func configureView() {
        view.addSubview(messageLabel)
        messageLabel.centerAnchors == view.centerAnchors
    }
}
