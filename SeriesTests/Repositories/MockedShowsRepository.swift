//
//  MockedShowsRepository.swift
//  SeriesTests
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation
import ReactiveSwift
@testable import Series

final class MockedShowsRepository: ShowsRepositoryType {

    var shows: [Show] = []

    func fetchShows() -> SignalProducer<[Show], NoError> {
        return SignalProducer(value: shows)
    }


}
