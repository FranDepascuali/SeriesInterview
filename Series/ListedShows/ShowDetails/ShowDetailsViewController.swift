//
//  ShowDetailsViewController.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit
import PureLayout

class ShowDetailsViewController: UIViewController {

    fileprivate let _viewModel: ShowDetailsViewModel

    fileprivate let _view = ShowDetailsView()

    init(viewModel: ShowDetailsViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        view.addSubview(_view)
        _view.autoPinEdgesToSuperviewEdges()
    }
}

fileprivate extension ShowDetailsViewController {

    fileprivate func bindViewModel() {
        // TODO: Complete this
    }

}
