//
//  ListedShowsViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import ReactiveSwift

class ListedShowsViewModel {

    fileprivate let _showsRepository: ShowsRepositoryType

    fileprivate let _shows: MutableProperty<[Show]> = .init([])

    let shows: ReadOnlyProperty<[Show]>

    init(showsRepository: ShowsRepositoryType) {
        shows = ReadOnlyProperty(_shows)
        _showsRepository = showsRepository
    }

    func numberOfShows() -> Int {
        return _shows.value.count
    }

    func fetchShows() -> SignalProducer<(), NoError> {
        return _showsRepository
            .fetchShows()
            .on(value: { [unowned self] shows in
                self._shows.value = shows
            })
            .map { _ in }
    }

    func createShowPreviewCellViewModel(forIndex index: Int) -> ShowPreviewCellViewModel {
        return ShowPreviewCellViewModel(show: _shows.value[index])
    }

    func createShowDetailsViewModel(forIndex index: Int) -> ShowDetailsViewModel {
        return ShowDetailsViewModel(show: _shows.value[index])
    }
}
