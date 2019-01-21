//
//  ShowDetailsViewModelSpec.swift
//  SeriesTests
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

@testable import Series
import Quick
import Nimble

class ShowDetailsViewModelSpec: QuickSpec {

    override func spec() {

        var showDetailsViewModel: ShowDetailsViewModel!

        var mockedUserRepository: MockedUserRepository!

        beforeEach {
            mockedUserRepository = MockedUserRepository()
            showDetailsViewModel = ShowDetailsViewModel(show: .breakingBad, userRepository: mockedUserRepository)
        }

        describe("#subscribed") {

            context("When the user is not subscribed") {

                it("should return false") {
                    expect(showDetailsViewModel.subscribed.value) == false
                }

                context("When the user subscribes") {

                    it("should return true") {
                        expect(showDetailsViewModel.subscribed.value) == false
                        showDetailsViewModel.subscribeTapped()
                        expect(showDetailsViewModel.subscribed.value) == true
                    }

                }
            }

            context("When the user is already subscribed") {

                beforeEach {
                    mockedUserRepository.currentUserFaked.value = User(subscribedTo: [.breakingBad])
                    showDetailsViewModel = ShowDetailsViewModel(show: .breakingBad, userRepository: mockedUserRepository)
                }

                it("should return true") {
                    expect(showDetailsViewModel.subscribed.value) == true
                }

                context("When the user unsubscribes") {

                    it("should return false") {
                        expect(showDetailsViewModel.subscribed.value) == true
                        showDetailsViewModel.subscribeTapped()
                        expect(showDetailsViewModel.subscribed.value) == false
                    }

                }
            }

        }

        describe("#year") {

            context("When asking for the year") {

                beforeEach {
                    showDetailsViewModel = ShowDetailsViewModel(show: createShowWithYear(year: 2016), userRepository: mockedUserRepository)
                }

                it("should match the show's year") {
                    expect(showDetailsViewModel.year) == "2016"
                }
            }

        }
    }

}

fileprivate func createShowWithYear(year: Int) -> Show {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    let date = formatter.date(from: "\(year)/10/08 22:31")!
    return Show(id: 0, title: "", overview: "", airDate: date, genres: [], relativeBackdropImageURL: "", relativePosterImageURL: "")
}
