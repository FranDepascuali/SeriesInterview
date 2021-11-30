//
//  ShowDetailsViewModel.swift
//  Series
//
//  Created by Francisco Depascuali on 16/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import ReactiveSwift

import enum Result.NoError
import struct Result.AnyError

final class ShowDetailsViewModel {

    fileprivate let _show: Show

    fileprivate let _userRepository: UserRepositoryType

    fileprivate let _subscribed: MutableProperty<Bool>

    fileprivate let _posterImage: MutableProperty<UIImage?> = .init(nil)

    let subscribed: ReadOnlyProperty<Bool>

    let posterImage: ReadOnlyProperty<UIImage?>

    init(show: Show, userRepository: UserRepositoryType) {
        _show = show
        _userRepository = userRepository
        _subscribed = .init(_userRepository.currentUser.value.subscribedTo.contains(_show))
        subscribed = ReadOnlyProperty(_subscribed)

        posterImage = ReadOnlyProperty(_posterImage)
    }

    func loadImage() -> SignalProducer<(), NoError> {
        return imageFromUrl(urlString: posterURL)
            .on(value: { image in
                self._posterImage.value = image
            })
            .map { _ in }
    }

    func subscribeTapped() {
        if subscribed.value {
            _userRepository
                .unsubscribe(from: _show)
                .on(value: { [unowned self] (_: ()) in
                    self._subscribed.value = false
                })
                .start()
        } else {
            _userRepository
                .subscribe(to: _show)
                .on(value: { [unowned self] (_: ()) in
                    self._subscribed.value = true
                })
                .start()
        }

    }

    var overview: String {
        return _show.overview
    }

    var title: String {
        return _show.title
    }

    var year: String {
        let calendar = Calendar.current

        return "\(calendar.component(.year, from: _show.airDate))"
    }

    var posterURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w200/\(_show.relativePosterImageURL)"
    }

    var backdropURL: String {
        // TODO: Change this
        return "https://image.tmdb.org/t/p/w1280/\(_show.relativeBackdropImageURL)"
    }
}

// TODO: This should be moved from here
func imageFromUrl(urlString: String) -> SignalProducer<UIImage, NoError> {
    return SignalProducer.init { observer, lifetime in
        URLSession
            .shared
            .dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
                if
                    let data = data,
                    let image = UIImage(data: data) {
                    observer.send(value: image)
                    observer.sendCompleted()
                } else {
                    observer.sendCompleted()
                }
            })
            .resume()
    }
}
