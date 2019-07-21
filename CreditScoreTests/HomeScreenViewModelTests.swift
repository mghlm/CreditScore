//
//  HomeScreenViewModel.swift
//  CreditScoreTests
//
//  Created by Magnus Holm on 20/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CreditScore

class HomeScreenViewModelTests: XCTestCase {

    var viewModel: HomeScreenViewModelType!
    var apiServiceMock: APIServiceMock!
    override func setUp() {
        apiServiceMock = APIServiceMock()
        viewModel = HomeScreenViewModel(apiService: apiServiceMock)
    }

    // given when then
    func testViewModel_diLoadIsCalledAndResponseIsSuccess_ScoreIsCorrect() {
        let expectation = self.expectation(description: "Score")
        viewModel.didLoad { _ in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(viewModel.score, "173")
    }
    
    func testViewModel_diLoadIsCalledAndResponseIsFailure_ScoreIsNil() {
        let expectation = self.expectation(description: "Score")
        apiServiceMock.isSucceded = false
        viewModel.didLoad { _ in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        XCTAssertNil(viewModel.score)
    }

}
