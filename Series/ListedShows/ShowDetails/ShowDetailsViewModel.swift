//
//  ShowDetailsViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

final class ShowDetailsViewModel {

    fileprivate let _show: Show

    init(show: Show) {
        _show = show
    }

    var overview: String {
        return _show.overview
    }

    var title: String {
        return _show.title
    }

    var year: String {
        let date = Date()
        let calendar = Calendar.current

        return "\(calendar.component(.year, from: date))"
    }

    //        var year: String {
    //            return
    //        }
}
