//
//  Show.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {

    let subscribedTo: [Show]

}

struct Genre {

    let id: Int

    let name: String
}

struct Show: Equatable {

    static func == (lhs: Show, rhs: Show) -> Bool {
        return lhs.id == rhs.id
    }

    let id: Int

    let title: String

    let overview: String

    let airDate: Date

    let genres: [Genre]

    let relativeBackdropImageURL: String

    let relativePosterImageURL: String
}

extension Show {

    init?(json: JSON, allGenres: [Genre]) {
        guard
            let id = json["id"].int,
            let title = json["name"].string,
            let overview = json["overview"].string,
            let rawAirDate = json["first_air_date"].string,
            let airDate = DateFormatter.yyyyMMdd.date(from: rawAirDate),
            let genresIds = parseGenresIds(json: json),
            let relativeBackdropImageURL = json["backdrop_path"].string,
            let relativePosterImageURL = json["poster_path"].string
            else {
                return nil
        }

        let genres = allGenres.filter { genre in genresIds.contains(where: { $0 == genre.id } )}

        self = Show.init(id: id, title: title, overview: overview, airDate: airDate, genres: genres, relativeBackdropImageURL: relativeBackdropImageURL, relativePosterImageURL: relativePosterImageURL)
    }
}

extension Genre {
    init?(json: JSON) {
        guard
            let genreId = json["id"].int,
            let name = json["name"].string else {
                return nil
        }

        self = Genre(id: genreId, name: name)
    }
}

fileprivate func parseGenresIds(json: JSON) -> [Int]? {
    guard let genresIds = json["genre_ids"].array?.compactMap({ $0.int }), !genresIds.isEmpty else {
        return nil
    }

    return genresIds
}
