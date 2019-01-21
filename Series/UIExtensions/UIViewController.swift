//
//  UIViewController.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

extension UIViewController {

    func load(childViewController: UIViewController, into containerView: UIView) {
        childViewController.willMove(toParent: self)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
        containerView.addSubview(childViewController.view)
        childViewController.view.autoPinEdgesToSuperviewEdges()
    }

}
