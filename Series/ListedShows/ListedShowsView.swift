//
//  ListedShowsView.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

class ListedShowsView: UIView {

    // I think this is better than tableView because collection views
    // are more adaptable to new layouts. So, if there is a change in
    // how we display the elements, a collectionView will adapt better
    let allShows = createAllShowsCollection()

    let allLabel: UILabel = createAllLabel()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension ListedShowsView {

    fileprivate func addSubviews() {
        addSubview(allLabel)
        addSubview(allShows)
    }

    fileprivate func setConstraints() {
        allLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
        allLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)

        allShows.autoPinEdge(.top, to: .bottom, of: allLabel, withOffset: 20)
        allShows.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
        allShows.autoPinEdge(toSuperviewEdge: .right, withInset: 15)
        allShows.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
    }

}


fileprivate func createAllLabel() -> UILabel {
    let allLabel = UILabel()

    allLabel.textColor = .white
    allLabel.alpha = 0.44
    // TODO: Localize this
    allLabel.text = "ALL"
    allLabel.font = .systemFont(ofSize: 12, weight: UIFont.Weight.medium)

    return allLabel
}

fileprivate func createAllShowsCollection() -> UICollectionView {
    let allShows = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())

    allShows.backgroundColor = .clear

    return allShows
}

fileprivate func createCollectionViewLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()

    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 20
    // TODO: Change this
    layout.itemSize = CGSize(width: 335, height: 156)

    return layout
}
