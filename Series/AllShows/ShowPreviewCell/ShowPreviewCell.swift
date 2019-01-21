//
//  ShowPreviewCell.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit
import SDWebImage

final class ShowPreviewCell: UICollectionViewCell {

    let backgroundImageView: UIImageView = createBackgroundImageView()

    let titleLabel: UILabel = createTitleLabel()

    let genreLabel: UILabel = createGenreLabel()

    let genreContainer: UIView = createGenreContainerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        fake()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fake() {
        backgroundImageView.image = UIImage(named: "fake-show-image")
    }

    func bindViewModel(viewModel: ShowPreviewCellViewModel) {
        genreLabel.text = viewModel.genre
        titleLabel.text = viewModel.title
        backgroundImageView.sd_setImage(with: URL(string: viewModel.backdropURL))
    }

}

fileprivate extension ShowPreviewCell {

    fileprivate func addSubviews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
//        contentView.addSubview(genreLabel)
        contentView.addSubview(genreContainer)
        genreContainer.addSubview(genreLabel)
    }

    fileprivate func setConstraints() {
        genreContainer.autoPinEdge(toSuperviewEdge: .right, withInset: 7)
        genreContainer.autoPinEdge(toSuperviewEdge: .top, withInset: 7)
        genreLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15))

        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
        // Just in case there is a long text, trim it
        titleLabel.autoPinEdge(toSuperviewEdge: .right)

        backgroundImageView.autoPinEdgesToSuperviewEdges()
    }

}

fileprivate func createBackgroundImageView() -> UIImageView {
    let backgroundImageView = UIImageView()

    return backgroundImageView
}

fileprivate func createTitleLabel() -> UILabel {
    let titleLabel = UILabel()

    titleLabel.textColor = UIColor(hexString: "e1f5ff")
    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)

    return titleLabel
}

fileprivate func createGenreLabel() -> UILabel {
    let genreLabel = UILabel()

    genreLabel.textColor = .white
    genreLabel.numberOfLines = 1
    genreLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)

    return genreLabel
}

fileprivate func createGenreContainerView() -> UIView {
    let genreContainer = UIView()

    genreContainer.backgroundColor = UIColor(hexString: "#1e2b31")
    genreContainer.layer.cornerRadius = 3
    genreContainer.layer.masksToBounds = true

    return genreContainer
}
