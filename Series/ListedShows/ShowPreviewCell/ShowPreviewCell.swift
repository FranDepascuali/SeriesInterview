//
//  ShowPreviewCell.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

final class ShowPreviewCell: UICollectionViewCell {

    let backgroundImageView: UIImageView = createBackgroundImageView()

    let titleLabel: UILabel = createTitleLabel()

    let genreLabel: UILabel = createGenreLabel()

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
//        thumb.sd_setImage(with: URL(string: viewModel.thumbURL), placeholderImage: UIImage(named: "placeholder"))
    }

}

fileprivate extension ShowPreviewCell {

    fileprivate func addSubviews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
    }

    fileprivate func setConstraints() {
        genreLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 7)
        genreLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 7)

        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)

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

    genreLabel.backgroundColor = UIColor(hexString: "#1e2b31")
    genreLabel.textColor = .white
    genreLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)

    return genreLabel
}
