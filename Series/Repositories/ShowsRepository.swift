//
//  ShowsRepository.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol ShowsRepositoryType {

    // TODO: Change this
    func fetchShows() -> SignalProducer<[Show], NoError>
}

final class ShowsRepository: ShowsRepositoryType {

    let _networkRepository: NetworkRepositoryType

    init(networkRepository: NetworkRepositoryType = NetworkRepository()) {
        _networkRepository = networkRepository
    }

    func fetchShows() -> SignalProducer<[Show], NoError> {
        return .empty
    }

}

final class FakeShowsRepository: ShowsRepositoryType {

    func fetchShows() -> SignalProducer<[Show], NoError> {
        return SignalProducer(value: [
            Show.supergirl,
            Show.supergirl,
            Show.sherlock,
            Show.breakingBad,
            Show.hawaiFive,
            Show.breakingBad,
            Show.hawaiFive])
    }

}
