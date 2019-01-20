//
//  ShowDetailsView.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

class ShowDetailsView: UIView {

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
        fake()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension ShowDetailsView {

    fileprivate func fake() {
//        showImageView.image = UIImage(named: "sample")
//        titleLabel.text = "Breaking Bad"
//        yearLabel.text = "2011"
//        overviewTextView.text = "Breaking Bad is an American neo-western crime drama television series created and produced by Vince Gilligan. The show originally aired on AMC for five seasons, from January 20, 2008 to September 29, 2013. Set and filmed in Albuquerque, New Mexico, the series tells the story of Walter White (Bryan Cranston), a struggling and depressed high school chemistry teacher who is diagnosed with lung cancer. Together with his former student Jesse Pinkman (Aaron Paul), White turns to a life of crime by producing and selling crystallized methamphetamine to secure his family's financial future before he dies, while navigating the dangers of the criminal world. "

        //        backgroundColor = UIColor(red: 225, green: 184, blue: 85, alpha: 0)
//        backgroundColor = .red
    }

    fileprivate func addSubviews() {
        addSubview(opacityView)
        addSubview(backgroundImageView)
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(showImageView)
        addSubview(yearLabel)
        addSubview(overviewLabel)
        addSubview(overviewTextView)
        addSubview(subscribeButton)

        sendSubviewToBack(opacityView)
        sendSubviewToBack(backgroundImageView)
    }

    fileprivate func setConstraints() {
        backgroundImageView.autoPinEdgesToSuperviewEdges()
        opacityView.autoPinEdgesToSuperviewEdges()

        backButton.autoPinEdge(toSuperviewEdge: .top, withInset: 25)
        backButton.autoPinEdge(toSuperviewEdge: .left, withInset: 13)
        backButton.autoSetDimensions(to: CGSize(width: 28, height: 28))

        showImageView.autoPinEdge(.top, to: .top, of: backButton, withOffset: 18)
        showImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        showImageView.autoSetDimensions(to: CGSize(width: 182, height: 273))

        titleLabel.autoPinEdge(.top, to: .bottom, of: showImageView, withOffset: 20)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        yearLabel.autoAlignAxis(.vertical, toSameAxisOf: titleLabel)
        yearLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 2)

        subscribeButton.autoAlignAxis(.vertical, toSameAxisOf: titleLabel)
        subscribeButton.autoPinEdge(.top, to: .bottom, of: yearLabel, withOffset: 20)
        subscribeButton.autoSetDimension(.width, toSize: 195)
        subscribeButton.autoSetDimension(.height, toSize: 45)

        overviewLabel.autoPinEdge(.top, to: .bottom, of: subscribeButton, withOffset: 43)

        overviewLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 37)

        overviewTextView.autoPinEdge(.top, to: .bottom, of: overviewLabel, withOffset: 20)
        overviewTextView.autoPinEdge(.left, to: .left, of: overviewLabel)

        // TODO: Take this out
        overviewTextView.autoPinEdge(.bottom, to: .bottom, of: self)
        overviewTextView.autoPinEdge(toSuperviewEdge: .right, withInset: 37)
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
//    backgroundImageView.
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

    // TODO: Move to localizable
    subscribeButton.setTitle("SUBSCRIBE", for: .normal)
    subscribeButton.layer.cornerRadius = 20
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
