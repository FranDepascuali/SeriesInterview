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
        return _networkRepository
            .request(URL: "https://api.themoviedb.org/3/tv/top_rated?api_key=208ca80d1e219453796a7f9792d16776&language=en-US&page=1")
            .take(first: 1)
            .map { json in
                let data = try! json["results"].rawData()
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.formatted(DateFormatter.yyyyMMdd)
                let shows: [Show] = try! decoder.decode([Show].self, from: data)
                return shows
        }
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

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
