//
//  Show.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

struct User {

    let subscribedTo: [Show]

}

struct Show {

    let title: String

    let overview: String

    let airDate: Date

    let genre: String = "Animation"

    let relativeBackdropImageURL: String

    let relativePosterImageURL: String

    static var breakingBad: Show {
        return Show(
            title: "Breaking Bad",
            overview: "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
            airDate: Date(),
//            genre: "Animation",
            relativeBackdropImageURL: "/eSzpy96DwBujGFj0xMbXBcGcfxX.jpg",
            relativePosterImageURL: "/1yeVJox3rjo2jBKrrihIMj7uoS9.jpg")

    }

    static var hawaiFive: Show {
        return Show(title: "Hawaii Five-0", overview: "Steve McGarrett returns home to Oahu, in order to find his father's killer. The governor offers him the chance to run his own task force (Five-0). Steve's team is joined by Chin Ho Kelly, Danny \"Danno\" Williams, and Kono Kalakaua.", airDate: Date(),
//                    genre: "Crime",
                    relativeBackdropImageURL: "/2wig5p3n4AMHGjedvYk7ZgJ4481.jpg", relativePosterImageURL: "/gEbD5od43txhKQ7BaNCjN7q4txR.jpg")
    }

    static var supergirl: Show {
        return Show(
            title: "Supergirl",
            overview: "Twenty-four-year-old Kara Zor-El, who was taken in by the Danvers family when she was 13 after being sent away from Krypton, must learn to embrace her powers after previously hiding them. The Danvers teach her to be careful with her powers, until she has to reveal them during an unexpected disaster, setting her on her journey of heroism.",
            airDate: Date(),
//            genre: "Adventure",
            relativeBackdropImageURL: "/2qou2R47XZ1N6SlqGZcoCHDyEhN.jpg",
            relativePosterImageURL: "/vqBsgL9nd2v04ZvCqPzwtckDdFD.jpg")
    }

    static var sherlock: Show {
        return Show(
            title: "Sherlock",
            overview: "A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.",
            airDate: Date(),
//            genre: "Crime",
            relativeBackdropImageURL: "/bvS50jBZXtglmLu72EAt5KgJBrL.jpg",
            relativePosterImageURL: "/f9zGxLHGyQB10cMDZNY5ZcGKhZi.jpg")
    }
}

extension Show: Codable {

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case overview
        case airDate = "first_air_date"
        case relativeBackdropImageURL = "backdrop_path"
        case relativePosterImageURL = "poster_path"
    }
}
