//
//  ShowDetailsViewController.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit
import PureLayout
import ReactiveCocoa

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

    override func viewDidLoad() {
        super.viewDidLoad()
        _view
            .backButton
            .reactive
            .controlEvents(.touchUpInside)
            .producer
            .startWithValues { [unowned self] _ in
                self.navigationController?.popViewController(animated: true)
        }

        bindViewModel()
    }
}

fileprivate extension ShowDetailsViewController {

    fileprivate func bindViewModel() {
        _view.overviewTextView.text = _viewModel.overview
        _view.titleLabel.text = _viewModel.title
        _view.yearLabel.text = _viewModel.year
    }

}
