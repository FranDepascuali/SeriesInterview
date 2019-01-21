//
//  MainViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

final class MainViewModel {

    fileprivate let _userRepository: UserRepositoryType

    fileprivate let _showsRepository: ShowsRepositoryType

    let isSubscribedToAShow: ReadOnlyProperty<Bool>

    init(userRepository: UserRepositoryType, showsRepository: ShowsRepositoryType) {
        _userRepository = userRepository
        _showsRepository = showsRepository

        isSubscribedToAShow = _userRepository.currentUser.map { !$0.subscribedTo.isEmpty }
    }

    func createSubscribedShowsViewModel() -> SubscribedShowsViewModel {
        return SubscribedShowsViewModel(userRepository: _userRepository)
    }

    func createAllShowsViewModel() -> AllShowsViewModel {
        return AllShowsViewModel(showsRepository: _showsRepository, userRepository: _userRepository)
    }
}
