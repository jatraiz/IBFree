//
//  RZLogoImageView.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 1/25/17.
//  Copyright © 2017 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

final class RZLogoImageView: UIImageView {

    static let size = CGSize(width: 150, height: 150)

    init() {
        
        super.init(frame: CGRect.zero)

        image = UIImage(named: "raizlabs-logo")

        heightAnchor == RZLogoImageView.size.height
        widthAnchor == RZLogoImageView.size.width
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }

    @available(*, unavailable) override init(frame: CGRect) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init() instead")
    }
}

