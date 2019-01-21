//
//  AllShowsViewModelSpec.swift
//  SeriesTests
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

@testable import Series
import Quick
import Nimble

class AllShowsViewModelSpec: QuickSpec {

    override func spec() {

        var allShowsViewModel: AllShowsViewModel!

        var mockedShowsRepository: MockedShowsRepository!

        var mockedUserRepository: MockedUserRepository!

        beforeEach {
            mockedShowsRepository = MockedShowsRepository()
            mockedUserRepository = MockedUserRepository()
            allShowsViewModel = AllShowsViewModel(
                showsRepository: mockedShowsRepository,
                userRepository: mockedUserRepository
            )
        }

        describe("#numberOfShows") {

            context("When there are no shows") {

                it("should return 0") {
                    mockedShowsRepository.shows = []
                    expect(allShowsViewModel.numberOfShows()) == 0
                }
            }

            context("When there are shows") {

                it("should return the number of shows") {
                    mockedShowsRepository.shows = [Show.breakingBad, Show.hawaiFive]
                    _ = allShowsViewModel.fetchShows().wait()
                    expect(allShowsViewModel.numberOfShows()).toEventually(be(mockedShowsRepository.shows.count))
                }
            }
        }
    }

}
