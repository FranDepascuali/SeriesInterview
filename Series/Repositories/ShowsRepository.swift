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

    fileprivate let _genres: MutableProperty<[Genre]>

    init(networkRepository: NetworkRepositoryType = NetworkRepository()) {
        _networkRepository = networkRepository
        _genres = .init([])
    }

    func fetchShows() -> SignalProducer<[Show], NoError> {
        let producer: SignalProducer<[Genre], NoError>

        if !_genres.value.isEmpty {
            producer = _genres.producer
        } else {
            producer = fetchGenres()
        }

        return producer
            .flatMap(.latest) { genres -> SignalProducer<[Show], NoError> in
                //                return SignalProducer(value: Show.init(json: <#T##JSON#>, allGenres: <#T##[Genre]#>))
                return self._networkRepository
                    .request(URL: "https://api.themoviedb.org/3/tv/top_rated?api_key=208ca80d1e219453796a7f9792d16776&language=en-US&page=1")
                    .map { json in
                        guard let rawShows = json["results"].array else {
                            return []
                        }
                        return rawShows.compactMap { Show.init(json: $0, allGenres: genres) }
                }
        }
    }

    fileprivate func fetchGenres() -> SignalProducer<[Genre], NoError> {
        return _networkRepository
            .request(URL: "https://api.themoviedb.org/3/genre/tv/list?api_key=208ca80d1e219453796a7f9792d16776&language=en-US")
            .map { json in
                guard let rawGenres = json["genres"].array else {
                    return []
                }
                return rawGenres.compactMap { Genre.init(json: $0) }
            }
            .on(value: { genres in
                self._genres.value = genres
            })
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
