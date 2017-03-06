//
//  MainViewController.swift
//  XIBLessExample
//
//  Created by John Stricker on 6/20/16.

import Anchorage
import UIKit

final class MainViewController: UIViewController {

    private let xibView = XibView(frame: CGRect.zero)
    private let xibLessView = XiblessView(style: .CornerButtons)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// MARK: - View Configuration

private extension MainViewController {

    func configureViews() {

        // View Heirarchy

        view.addSubview(xibView)
        view.addSubview(xibLessView)

        // Style

        view.backgroundColor = UIColor.whiteColor()

        // Layout

        // Xib view is placed at the top below the status bar with half the height of the view
        xibView.topAnchor          == view.topAnchor
        xibView.horizontalAnchors  == view.horizontalAnchors
        xibView.heightAnchor       == view.heightAnchor / 2.0

        // Xibless view is placed below the XIB view and otherwise its layout is the same
        xibLessView.topAnchor          == xibView.bottomAnchor
        xibLessView.horizontalAnchors  == xibView.horizontalAnchors
        xibLessView.heightAnchor       == xibView.heightAnchor
    }
}

