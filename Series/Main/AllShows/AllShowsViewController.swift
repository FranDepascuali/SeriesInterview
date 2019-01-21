//
//  ListedShowsViewController.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit
import ReactiveSwift

final class AllShowsViewController: UIViewController {

    fileprivate let _view = AllShowsView()

    fileprivate let _viewModel: AllShowsViewModel

    init(viewModel: AllShowsViewModel) {
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
        _view.allShows.dataSource = self
        _view.allShows.delegate = self
        _view.allShows.register(ShowPreviewCell.self, forCellWithReuseIdentifier: "ShowPreviewCell")
        navigationController?.navigationBar.isHidden = true

        bindViewModel()
    }
}

//TODO: white scrolling indicator 
extension AllShowsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel.numberOfShows()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let showPreviewCell = _view.allShows.dequeueReusableCell(withReuseIdentifier: "ShowPreviewCell", for: indexPath) as! ShowPreviewCell

        let showPreviewCellViewModel = _viewModel.createShowPreviewCellViewModel(forIndex: indexPath.row)

        showPreviewCell.bindViewModel(viewModel: showPreviewCellViewModel)
        return showPreviewCell
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

fileprivate extension AllShowsViewController {

    fileprivate func bindViewModel() {
        _viewModel
            .fetchShows()
            .producer
            .startWithValues { [unowned self] _ in
                self._view.allShows.reloadData()
        }

    }

}
