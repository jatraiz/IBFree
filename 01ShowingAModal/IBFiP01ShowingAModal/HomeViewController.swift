//
//  HomeViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/28/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

final class HomeViewController: UIViewController {

    let testView = TestXiblessView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = UIColor.green

        view?.addSubview(testView)

        testView.backgroundColor = UIColor.red

        if let view = view {
            testView.edgeAnchors == view.edgeAnchors
        }
    }
}
