//
//  MainViewController.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    fileprivate let _view = MainView()

    fileprivate let _subscribedShowsViewController: SubscribedShowsViewController

    fileprivate let _allShowsViewController: ListedShowsViewController

    fileprivate let _viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        _viewModel = viewModel
        _subscribedShowsViewController = SubscribedShowsViewController(viewModel: _viewModel.createSubscribedShowsViewModel())
        _allShowsViewController = ListedShowsViewController(viewModel: _viewModel.createAllShowsViewModel())
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(hexString: "#1b1b1b")
        view.addSubview(_view)
        _view.autoPinEdgesToSuperviewEdges()
        load(childViewController: _subscribedShowsViewController, into: _view.subscribedShowsContainerView)
        load(childViewController: _allShowsViewController, into: _view.allShowsContainerView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

fileprivate extension MainViewController {

    fileprivate func bindViewModel() {
        _viewModel
            .isSubscribedToAShow
            .producer
            .skipRepeats()
            .startWithValues { [unowned self] subscribed in
                self._view.subscribedShowsLabel.isHidden = !subscribed
                self._view.subscribedShowsContainerView.isHidden = !subscribed
        }
    }

}
