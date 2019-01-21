//
//  ShowDetailsViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import ReactiveSwift

final class ShowDetailsViewModel {

    fileprivate let _show: Show

    fileprivate let _userRepository: UserRepositoryType

    fileprivate let _subscribed: MutableProperty<Bool>

    let subscribed: ReadOnlyProperty<Bool>

    init(show: Show, userRepository: UserRepositoryType) {
        _show = show
        _userRepository = userRepository
        _subscribed = .init(_userRepository.currentUser.value.subscribedTo.contains(_show))
        subscribed = ReadOnlyProperty(_subscribed)
    }

    func subscribeTapped() {
        if subscribed.value {
            _userRepository
                .unsubscribe(from: _show)
                .on(value: { [unowned self] _ in
                    self._subscribed.value = false
                })
                .start()
        } else {
            _userRepository
                .subscribe(to: _show)
                .on(value: { [unowned self] _ in
                    self._subscribed.value = true
                })
                .start()
        }

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

    var posterURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w200/\(_show.relativePosterImageURL)"
    }

    var backdropURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w1280/\(_show.relativeBackdropImageURL)"
    }
}
