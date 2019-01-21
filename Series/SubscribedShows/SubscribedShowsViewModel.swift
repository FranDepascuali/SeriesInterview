//
//  SubscribedShowsViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import ReactiveSwift


final class SubscribedShowsViewModel {

    fileprivate let _userRepository: UserRepositoryType

    fileprivate let subscribedShows: ReadOnlyProperty<[Show]>

    let fetchSubscribedShows: SignalProducer<(), NoError>

    init(userRepository: UserRepositoryType) {
        _userRepository = userRepository

        subscribedShows = _userRepository.currentUser.map { $0.subscribedTo }
        fetchSubscribedShows = subscribedShows.map { _ in }.producer
    }

    func numberOfSubscribedShows() -> Int {
        return subscribedShows.value.count
    }

    func createSubscribedCellViewModel(forIndex index: Int) -> SubscribedShowPreviewCellViewModel {
        return SubscribedShowPreviewCellViewModel(show: subscribedShows.value[index])
    }

    func createShowDetailsViewModel(forIndex index: Int) -> ShowDetailsViewModel {
        return ShowDetailsViewModel(show: subscribedShows.value[index], userRepository: _userRepository)
    }
}
