//
//  MainView.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

final class MainView: UIView {

    let containerStackView: UIStackView = createContainerStackView()

    let subscribedShowsLabel: UILabel = createSubscribedShowsLabel()

    let subscribedShowsContainerView = UIView()

    let allShowsLabel: UILabel = createAllShowsLabel()

    let allShowsContainerView = UIView()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension MainView {

    fileprivate func addSubviews() {
        addSubview(containerStackView)

        containerStackView.addArrangedSubview(subscribedShowsLabel)
        containerStackView.addArrangedSubview(subscribedShowsContainerView)

        containerStackView.addArrangedSubview(allShowsLabel)
        containerStackView.addArrangedSubview(allShowsContainerView)
    }

    fileprivate func setConstraints() {
        containerStackView.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        subscribedShowsContainerView.autoSetDimension(.height, toSize: 150)
//        allShowsContainerView.autoSetDimension(.height, toSize: 150)
//        subscribedShowsLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
//        subscribedShowsLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
//
//        subscribedShowsContainerView.autoPinEdge(.top, to: .bottom, of: subscribedShowsLabel, withOffset: 20)
//        subscribedShowsContainerView.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
//        subscribedShowsContainerView.autoPinEdge(toSuperviewEdge: .right, withInset: 15)
//        subscribedShowsContainerView.autoSetDimension(.height, toSize: 150)
//
//        allShowsLabel.autoPinEdge(.top, to: .bottom, of: subscribedShowsContainerView, withOffset: 20)
//        allShowsLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
//
//        allShowsContainerView.autoPinEdge(.top, to: .bottom, of: allShowsLabel, withOffset: 20)
//        allShowsContainerView.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
//        allShowsContainerView.autoPinEdge(toSuperviewEdge: .right, withInset: 15)
//        allShowsContainerView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
    }

}

fileprivate func createAllShowsLabel() -> UILabel {
    let allLabel = UILabel()

    allLabel.textColor = .white
    allLabel.alpha = 0.44
    // TODO: Localize this
    allLabel.text = "ALL"
    allLabel.font = .systemFont(ofSize: 12, weight: UIFont.Weight.medium)

    return allLabel
}

fileprivate func createSubscribedShowsLabel() -> UILabel {
    let subscribedShowsLabel = UILabel()

    subscribedShowsLabel.textColor = .white
    subscribedShowsLabel.alpha = 0.44
    // TODO: Localize this
    subscribedShowsLabel.text = "SUBSCRIBED"
    subscribedShowsLabel.font = .systemFont(ofSize: 12, weight: UIFont.Weight.medium)

    return subscribedShowsLabel
}

fileprivate func createContainerStackView() -> UIStackView {
    let containerStackView = UIStackView()

    containerStackView.axis = .vertical
    containerStackView.spacing = 20
    
    return containerStackView
}
