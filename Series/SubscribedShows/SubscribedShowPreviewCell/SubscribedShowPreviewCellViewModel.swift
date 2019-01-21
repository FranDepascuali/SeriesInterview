//
//  SubscribedShowPreviewCellViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

struct SubscribedShowPreviewCellViewModel {

    fileprivate let _show: Show

    init(show: Show) {
        _show = show
    }

    var posterURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w200/\(_show.relativePosterImageURL)"
    }
}
