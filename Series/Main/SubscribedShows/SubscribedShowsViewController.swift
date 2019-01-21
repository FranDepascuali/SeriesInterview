//
//  SubscribedShowsViewController.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit
import ReactiveSwift

class SubscribedShowsViewController: UIViewController {

    fileprivate let _view = SubscribedShowsView()

    fileprivate let _viewModel: SubscribedShowsViewModel

    init(viewModel: SubscribedShowsViewModel) {
        _viewModel = viewModel
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.subscribedShowsCollectionView.dataSource = self
        _view.subscribedShowsCollectionView.delegate = self
        _view.subscribedShowsCollectionView.registerIdentifier(.subscribedShowCell)
        navigationController?.navigationBar.isHidden = true

        bindViewModel()
    }
}

//TODO: white scrolling indicator 
extension SubscribedShowsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel.numberOfSubscribedShows()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let subscribedShowcell: SubscribedShowPreviewCell = _view.subscribedShowsCollectionView.dequeueReusableCell(withIdentifier: .subscribedShowCell, indexPath: indexPath)

        let subscribedShowCellViewModel = _viewModel.createSubscribedCellViewModel(forIndex: indexPath.row)

        subscribedShowcell.bindViewModel(viewModel: subscribedShowCellViewModel)
        return subscribedShowcell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let showDetailsViewModel = _viewModel.createShowDetailsViewModel(forIndex: indexPath.row)

        showDetailsViewModel
            .loadImage()
            .producer
            .observe(on: UIScheduler())
            .startWithValues { _ in
                self.navigationController?.pushViewController(ShowDetailsViewController(viewModel: showDetailsViewModel), animated: true)
        }
    }
}

fileprivate extension SubscribedShowsViewController {

    fileprivate func bindViewModel() {
        _viewModel
            .fetchSubscribedShows
            .producer
            .startWithValues { [unowned self] _ in
                self._view.subscribedShowsCollectionView.reloadData()
        }

    }

}
