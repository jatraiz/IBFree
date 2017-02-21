//
//  DismissButton.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

/// A simple small X button used for dismissing modals
final class DismissButton: UIButton {

    init() {
        super.init(frame: CGRect.zero)

        backgroundColor = UIColor.clear
        tintColor = UIColor.white

        let image = UIImage(named: "icn-close")
        setImage(image, for: .normal)

        // Layout
        
        widthAnchor == 16
        heightAnchor == 16
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }

    @available(*, unavailable) convenience init(type buttonType: UIButtonType) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }
}
