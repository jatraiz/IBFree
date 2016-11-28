//
//  XiblessResponders
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/28/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

class XiblessView: UIView {

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("This is a Xibless UIView, init(coder:) has not been implemented.\nUse init() instead")
    }

    @available(*, unavailable) override init(frame: CGRect) {
        fatalError("This is a Xibless UIView, init(frame:) has not been implemented.\nUse init() instead")
    }

    /// Initializes the Xibless responder with CGRect.zero
    init() {
        super.init(frame: CGRect.zero)
    }
}

class XiblessButton: UIButton {

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("This is a Xibless UIButton, init(coder:) has not been implemented.\nUse init() instead")
    }

    @available(*, unavailable) override init(frame: CGRect) {
        fatalError("This is a Xibless UIButton, init(frame:) has not been implemented.\nUse init() instead")
    }

    /// Initializes the Xibless responder with CGRect.zero
    init() {
        super.init(frame: CGRect.zero)
    }
}

class XiblessImageView: UIImageView {

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("This is a Xibless UIImageView, init(coder:) has not been implemented.\nUse init() instead")
    }

    @available(*, unavailable) override init(frame: CGRect) {
        fatalError("This is a Xibless UIImageView, init(frame:) has not been implemented.\nUse init() instead")
    }

    /// Initializes the Xibless responder with CGRect.zero
    init() {
        super.init(frame: CGRect.zero)
    }
}
