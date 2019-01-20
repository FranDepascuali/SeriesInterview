//
//  ShowPreviewCellViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

struct ShowPreviewCellViewModel {

    fileprivate let _show: Show

    init(show: Show) {
        _show = show
    }

    var genre: String {
        return _show.genre
    }

    var title: String {
        return _show.title
    }

    var posterURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w200/\(_show.relativePosterImageURL)"
    }

    var backdropURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w200/\(_show.relativeBackdropImageURL)"
    }
}

