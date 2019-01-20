//
//  NetworkRepository.swift
//  Series
//
//  Created by Francisco Depascuali on 20/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation
import ReactiveSwift
import SwiftyJSON
import Alamofire

struct Routes {

    fileprivate let baseURL: NSURL

    fileprivate let apiKey: String

    init(apiKey: String = "208ca80d1e219453796a7f9792d16776",
         baseURL: NSURL = NSURL(string: "https://api.themoviedb.org/3")!) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    func shows() -> String {
        return "\(baseURL)/tv/top_rated?api_key=\(apiKey)&language=en-US&page=1"
    }

    func genres() -> String {
        return "\(baseURL)/genre/tv/list?api_key=\(apiKey)&language=en-US"
    }


}

protocol NetworkRepositoryType {

    func request(URL: String) -> SignalProducer<JSON, NoError>
}

class NetworkRepository: NetworkRepositoryType {

    // TODO: hide api key
    init() {

    }

    // TODO: Error type
    func request(URL: String) -> SignalProducer<JSON, NoError> {
        return SignalProducer.init { observer, lifetime in
            Alamofire
                .request(URL)
                .responseJSON { (responseData) -> Void in
                    if((responseData.result.value) != nil) {
                        let swiftyJsonVar = JSON(responseData.result.value!)
                        print(swiftyJsonVar)
                        observer.send(value: swiftyJsonVar)
                        observer.sendCompleted()
                    }
            }
        }
    }
}
