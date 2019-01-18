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

    fileprivate let _shows: ReadOnlyProperty<[Show]>

    let fetchShows: SignalProducer<(), NoError>

    init(showsRepository: ShowsRepositoryType) {
        _showsRepository = showsRepository
        _shows = ReadOnlyProperty(initial: [], then: _showsRepository.fetchShows())

        fetchShows = _shows.producer.map { _ in }
    }

    func numberOfShows() -> Int {
        return _shows.value.count
    }

    func createShowPreviewCellViewModel(forIndex index: Int) -> ShowPreviewCellViewModel {
        return ShowPreviewCellViewModel(show: _shows.value[index])
    }
}
