//
//  ReactiveSwift.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import ReactiveSwift

import enum Result.NoError
import struct Result.AnyError

//typealias NoError = Result.NoError
//typealias AnyError = Result.AnyError

typealias ReadOnlyProperty = ReactiveSwift.Property

func simpleDebugLog(identifier: String, event: String, fileName: String, functionName: String, lineNumber: Int) {
    // Don't forget to set up the DEBUG symbol (http://stackoverflow.com/a/24112024/491239)
    #if DEBUG
    print(">>>>>>[\(identifier)]: \(event)")
    #endif
}

extension SignalProducer {

    func skipDefaultValue() -> SignalProducer<Value, Error> {
        return self.skip(first: 1)
    }

    func logEventsSimple(name: String) -> SignalProducer<Value, Error> {
        return self.logEvents(identifier: name, events: LoggingEvent.SignalProducer.allEvents, logger: simpleDebugLog)
    }

    func ignoringErrors() -> SignalProducer<Value, NoError> {
        return flatMapError { _ in SignalProducer<Value, NoError>.empty }
    }

}
