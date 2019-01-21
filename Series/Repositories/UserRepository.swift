//
//  UserRepository.swift
//  Series
//
//  Created by Francisco Depascuali on 20/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import ReactiveSwift

protocol UserRepositoryType {

    var currentUser: ReadOnlyProperty<User> { get }

    func subscribe(to: Show) -> SignalProducer<(), NoError>

    func unsubscribe(from: Show) -> SignalProducer<(), NoError>

}

final class UserRepository: UserRepositoryType {

    private let _currentUser: MutableProperty<User> = .init(User(subscribedTo: []))

    let currentUser: ReadOnlyProperty<User>

    init() {
        currentUser = ReadOnlyProperty(_currentUser)
    }

    func subscribe(to show: Show) -> SignalProducer<(), NoError> {
        _currentUser.value = User(subscribedTo: _currentUser.value.subscribedTo + [show])
        // Note: This is not necesary right now, but ideally subscriptions will be fetched.
        return SignalProducer(value: ())
    }

    func unsubscribe(from show: Show) -> SignalProducer<(), NoError> {
        _currentUser.value = User(subscribedTo: _currentUser.value.subscribedTo.filter { $0 != show })
        // Note: This is not necesary right now, but ideally subscriptions will be fetched.
        return SignalProducer(value: ())
    }

}
