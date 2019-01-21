//
//  SubscribedShowsView.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

final class SubscribedShowsView: UIView {

    let subscribedShowsCollectionView: UICollectionView = createSubscribedShowsCollectionView()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension SubscribedShowsView {

    func addSubviews() {
        addSubview(subscribedShowsCollectionView)
    }

    func setConstraints() {
        subscribedShowsCollectionView.autoPinEdgesToSuperviewEdges()
    }

}

fileprivate func createSubscribedShowsCollectionView() -> UICollectionView {
    let subscribedShows = UICollectionView(frame: .zero, collectionViewLayout: createSubscribedShowsLayout())

    subscribedShows.backgroundColor = .clear

    return subscribedShows
}

fileprivate func createSubscribedShowsLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()

    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 20
    // TODO: Change this
    layout.itemSize = CGSize(width: 100, height: 150)

    return layout
}
