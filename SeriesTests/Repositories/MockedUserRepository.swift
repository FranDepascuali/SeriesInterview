//
//  MockedUserRepository.swift
//  SeriesTests
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation
import ReactiveSwift
@testable import Series

final class MockedUserRepository: UserRepositoryType {
    
    let currentUser: Property<User>

    let currentUserFaked: MutableProperty<User>

    init() {
        currentUserFaked = .init(User(subscribedTo: []))
        currentUser = ReadOnlyProperty(currentUserFaked)
    }

    func subscribe(to: Show) -> SignalProducer<(), NoError> {
        return .init(value: ())
    }

    func unsubscribe(from: Show) -> SignalProducer<(), NoError> {
        return .init(value: ())
    }

}
