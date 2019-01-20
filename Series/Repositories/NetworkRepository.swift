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

protocol NetworkRepositoryType {

    func request(URL: String) -> SignalProducer<JSON, NoError>
}

class NetworkRepository: NetworkRepositoryType {

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
