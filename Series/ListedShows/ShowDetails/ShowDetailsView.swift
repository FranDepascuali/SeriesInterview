//
//  ShowDetailsView.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

class ShowDetailsView: UIView {

    let containerScrollView: UIScrollView = createContainerScrollView()

    let contentView: UIView = UIView()

    let backgroundImageView: UIImageView = createBackgroundImageView()

    let opacityView: UIView = createOpacityView()

    let backButton: UIButton = createBackButton()

    let showImageView: UIImageView = createShowImageView()

    let titleLabel: UILabel = createTitleLabel()

    let yearLabel: UILabel = createYearLabel()

    let subscribeButton: UIButton = createSubscribeButton()

    let overviewLabel: UILabel = createOverviewLabel()

    let overviewTextView: UITextView = createOverviewTextView()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSubscriptionStyle(subscribed: Bool) {
        if subscribed {
            subscribeButton.backgroundColor = UIColor.white.withAlphaComponent(45)
            subscribeButton.setTitle("SUBSCRIBED", for: .normal)
            subscribeButton.setTitleColor(UIColor(hexString: "#f1be45"), for: .normal)
        } else {
            // TODO: Move to localizable
            subscribeButton.setTitle("SUBSCRIBE", for: .normal)
            subscribeButton.setTitleColor(.white, for: .normal)
            subscribeButton.backgroundColor = .clear
        }
    }
}

fileprivate extension ShowDetailsView {

    fileprivate func addSubviews() {
        addSubview(containerScrollView)
        addSubview(opacityView)
        addSubview(backgroundImageView)
        addSubview(backButton)

        containerScrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(showImageView)
        contentView.addSubview(yearLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(overviewTextView)
        contentView.addSubview(subscribeButton)

        sendSubviewToBack(opacityView)
        sendSubviewToBack(backgroundImageView)
    }

    fileprivate func setConstraints() {
        // The width will always match self width, so we pin it. 
        contentView.autoMatch(.width, to: .width, of: self)

        // Pin every side to the scroll view
        contentView.autoPinEdgesToSuperviewEdges()
        // Pin scroll view to self
        containerScrollView.autoPinEdgesToSuperviewEdges()

        backgroundImageView.autoPinEdgesToSuperviewEdges()
        opacityView.autoPinEdgesToSuperviewEdges()

        backButton.autoPinEdge(toSuperviewEdge: .top, withInset: 25)
        backButton.autoPinEdge(toSuperviewEdge: .left, withInset: 13)
        backButton.autoSetDimensions(to: CGSize(width: 28, height: 28))

        showImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 25)
        showImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        showImageView.autoSetDimensions(to: CGSize(width: 182, height: 273))

        titleLabel.autoPinEdge(.top, to: .bottom, of: showImageView, withOffset: 20)
        titleLabel.autoSetDimension(.height, toSize: 28)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        yearLabel.autoAlignAxis(.vertical, toSameAxisOf: titleLabel)
        yearLabel.autoSetDimension(.height, toSize: 18)
        yearLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 2)

        subscribeButton.autoAlignAxis(.vertical, toSameAxisOf: titleLabel)
        subscribeButton.autoPinEdge(.top, to: .bottom, of: yearLabel, withOffset: 20)
        subscribeButton.autoSetDimension(.width, toSize: 195)
        subscribeButton.autoSetDimension(.height, toSize: 45)

        overviewLabel.autoPinEdge(.top, to: .bottom, of: subscribeButton, withOffset: 43)
        overviewLabel.autoSetDimension(.height, toSize: 18)
        overviewLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 37)

        overviewTextView.autoPinEdge(.top, to: .bottom, of: overviewLabel, withOffset: 12)
        overviewTextView.autoPinEdge(.left, to: .left, of: overviewLabel)

        overviewTextView.autoPinEdge(toSuperviewEdge: .right, withInset: 37)
        overviewTextView.autoSetDimension(.height, toSize: 500)

        overviewTextView.autoPinEdge(.bottom, to: .bottom, of: contentView)
    }
}

fileprivate func createShowImageView() -> UIImageView {
    let showImageView = UIImageView()

    showImageView.layer.cornerRadius = 6
    showImageView.layer.masksToBounds = true

    return showImageView
}

fileprivate func createBackgroundImageView() -> UIImageView {
    let backgroundImageView = UIImageView()

    backgroundImageView.contentMode = .scaleAspectFill
    backgroundImageView.clipsToBounds = true

    return backgroundImageView
}

fileprivate func createOverviewLabel() -> UILabel {
    let overviewLabel = UILabel()

    // TODO: Localize this
    overviewLabel.text = "OVERVIEW"
    overviewLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)

    return overviewLabel
}

fileprivate func createOverviewTextView() -> UITextView {
    let overview = UITextView()

    overview.backgroundColor = .clear
    overview.textColor = .white
    overview.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
    overview.isScrollEnabled = false
    overview.isEditable = false
    overview.textContainer.lineFragmentPadding = 0

    return overview
}


fileprivate func createTitleLabel() -> UILabel {
    let titleLabel = UILabel()

    titleLabel.textColor = .white
    titleLabel.font = .boldSystemFont(ofSize: 24)

    return titleLabel

}

fileprivate func createYearLabel() -> UILabel {
    let yearLabel = UILabel()

    yearLabel.textColor = .white
    yearLabel.textAlignment = .center
    yearLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
    yearLabel.alpha = 0.8

    return yearLabel

}

fileprivate func createBackButton() -> UIButton {
    let backImageView = UIButton()

    backImageView.setImage(UIImage(named: "back_icon"), for: .normal)

    return backImageView
}

fileprivate func createSubscribeButton() -> UIButton {
    let subscribeButton = UIButton()

    subscribeButton.layer.cornerRadius = 20
    subscribeButton.layer.masksToBounds = true
    subscribeButton.layer.borderColor = UIColor.white.cgColor
    subscribeButton.layer.borderWidth = 2
    subscribeButton.titleLabel?.font = .boldSystemFont(ofSize: 16)

    return subscribeButton

}

fileprivate func createOpacityView() -> UIView {
    let opacityView = UIView()

    opacityView.alpha = 0.9

    return opacityView
}

fileprivate func createContainerScrollView() -> UIScrollView {
    return UIScrollView()
}
