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

    static var breakingBad: Show {
        return Show(
            id: 3,
            title: "Breaking Bad",
            overview: "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime. When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime. When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
            airDate: Date(),
            genres: [Genre.init(id: 0, name: "Animation")],
            relativeBackdropImageURL: "/eSzpy96DwBujGFj0xMbXBcGcfxX.jpg",
            relativePosterImageURL: "/1yeVJox3rjo2jBKrrihIMj7uoS9.jpg")

    }

    static var hawaiFive: Show {
        return Show(
            id: 2,title: "Hawaii Five-0", overview: "Steve McGarrett returns home to Oahu, in order to find his father's killer. The governor offers him the chance to run his own task force (Five-0). Steve's team is joined by Chin Ho Kelly, Danny \"Danno\" Williams, and Kono Kalakaua.", airDate: Date(),
                    genres: [Genre.init(id: 0, name: "Crime")],
                    relativeBackdropImageURL: "/2wig5p3n4AMHGjedvYk7ZgJ4481.jpg", relativePosterImageURL: "/gEbD5od43txhKQ7BaNCjN7q4txR.jpg")
    }

    static var supergirl: Show {
        return Show(
            id: 1,
            title: "Supergirl",
            overview: "Twenty-four-year-old Kara Zor-El, who was taken in by the Danvers family when she was 13 after being sent away from Krypton, must learn to embrace her powers after previously hiding them. The Danvers teach her to be careful with her powers, until she has to reveal them during an unexpected disaster, setting her on her journey of heroism.",
            airDate: Date(),
            genres: [Genre.init(id: 0, name: "Adventure")],
            relativeBackdropImageURL: "/2qou2R47XZ1N6SlqGZcoCHDyEhN.jpg",
            relativePosterImageURL: "/vqBsgL9nd2v04ZvCqPzwtckDdFD.jpg")
    }

    static var sherlock: Show {
        return Show(
            id: 0,
            title: "Sherlock",
            overview: "A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.",
            airDate: Date(),
            genres: [Genre.init(id: 0, name: "Animation")],
            relativeBackdropImageURL: "/bvS50jBZXtglmLu72EAt5KgJBrL.jpg",
            relativePosterImageURL: "/f9zGxLHGyQB10cMDZNY5ZcGKhZi.jpg")
    }
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
