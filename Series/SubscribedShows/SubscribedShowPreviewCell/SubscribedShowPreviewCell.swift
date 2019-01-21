//
//  SubscribedShowPreviewCell.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

final class SubscribedShowPreviewCell: UICollectionViewCell {

    let backgroundImageView: UIImageView = createBackgroundImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindViewModel(viewModel: SubscribedShowPreviewCellViewModel) {
        backgroundImageView.sd_setImage(with: URL(string: viewModel.posterURL))
    }

}

fileprivate extension SubscribedShowPreviewCell {

    fileprivate func addSubviews() {
        contentView.addSubview(backgroundImageView)
    }

    fileprivate func setConstraints() {
        backgroundImageView.autoPinEdgesToSuperviewEdges()
    }

}

fileprivate func createBackgroundImageView() -> UIImageView {
    let backgroundImageView = UIImageView()

    return backgroundImageView
}
