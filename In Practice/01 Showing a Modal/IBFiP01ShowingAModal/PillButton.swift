//
//  PillButton.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//
import Anchorage
import UIKit

/// A pill-shaped button with a raizlabs red background
final class PillButton: UIButton {

    init(title: String) {
        super.init(frame: CGRect.zero)
        configure(withTitle: title)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init(title:) instead")
    }

}

// MARK: - UIButton Overrides
extension PillButton {

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? Constant.enabledAlpha : Constant.disabledAlpha
        }
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? Constant.highlightedBackgroundColor : Constant.backgroundColor
        }
    }
}

// MARK: - Button Configuration
private extension PillButton {
    
    enum Constant {
        static let backgroundColor = AppColor.raizlabsRed
        static let disabledAlpha = CGFloat(0.4)
        static let disabledFontColor = AppColor.lightGray
        static let enabledAlpha = CGFloat(1)
        static let highlightedBackgroundColor = AppColor.red
        static let size = CGSize(width: 240, height: 60)
        static let titleColor = AppColor.white
        static let titleFont = AppFont.helvetica(20)
    }

    func configure(withTitle title: String) {
        setTitle(title, for: .normal)
        
        layer.cornerRadius = Constant.size.height / 2.0
        clipsToBounds = true

        setTitleColor(Constant.titleColor, for: .normal)
        setTitleColor(Constant.disabledFontColor, for: .disabled)

        backgroundColor = Constant.backgroundColor
        titleLabel?.font = Constant.titleFont

        // Layout
        heightAnchor == Constant.size.height
        widthAnchor == Constant.size.width
    }
}
