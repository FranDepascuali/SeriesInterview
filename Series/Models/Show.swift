//
//  Show.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

struct Show {

    let title: String

    let overview: String

    let airDate: Date

    let genre: String

    static var breakingBad: Show {
        return Show(
            title: "Breaking Bad",
            overview: "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
            airDate: Date(),
            genre: "Animation")

    }

    static var hawaiFive: Show {
        return Show(title: "Hawaii Five-0", overview: "Steve McGarrett returns home to Oahu, in order to find his father's killer. The governor offers him the chance to run his own task force (Five-0). Steve's team is joined by Chin Ho Kelly, Danny \"Danno\" Williams, and Kono Kalakaua.", airDate: Date(), genre: "Crime")
    }
}
