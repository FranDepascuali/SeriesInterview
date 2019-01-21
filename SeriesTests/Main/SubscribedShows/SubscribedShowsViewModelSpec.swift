//
//  SubscribedShowsViewModelSpec.swift
//  SeriesTests
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

@testable import Series
import Quick
import Nimble

class SubscribedShowsViewModelSpec: QuickSpec {

    override func spec() {

        var subscribedShowsViewModel: SubscribedShowsViewModel!

        var mockedUserRepository: MockedUserRepository!

        beforeEach {
            mockedUserRepository = MockedUserRepository()
            subscribedShowsViewModel = SubscribedShowsViewModel(userRepository: mockedUserRepository)
        }

        describe("#numberOfSubscribedShows") {

            context("When there are no subscribed shows") {

                it("should return 0") {
                    mockedUserRepository.currentUserFaked.value = User(subscribedTo: [])
                    expect(subscribedShowsViewModel.numberOfSubscribedShows()) == 0
                }
            }

            context("When there are shows") {

                it("should return the number of shows") {
                    waitUntil { done in
                        mockedUserRepository.currentUserFaked.value = User(subscribedTo: [Show.breakingBad, Show.hawaiFive])
                        subscribedShowsViewModel.fetchSubscribedShows.startWithValues {
                            expect(subscribedShowsViewModel.numberOfSubscribedShows())
                                .to(be(mockedUserRepository.currentUser.value.subscribedTo.count))
                            done()
                        }

                    }
                }
            }
        }
    }

}
