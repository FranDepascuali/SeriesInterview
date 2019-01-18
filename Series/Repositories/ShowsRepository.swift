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

final class FakeShowsRepository: ShowsRepositoryType {

    func fetchShows() -> SignalProducer<[Show], NoError> {
        return SignalProducer(value: [Show.breakingBad, Show.hawaiFive, Show.breakingBad, Show.hawaiFive])
    }

}
