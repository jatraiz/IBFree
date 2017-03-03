//
//  LogoImageView.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 1/25/17.
//  Copyright © 2017 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

final class LogoImageView: UIImageView {

    init() {
        super.init(frame: CGRect.zero)

        image = #imageLiteral(resourceName: "raizlabs-logo")

        heightAnchor == 150
        widthAnchor == 150
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }
}

