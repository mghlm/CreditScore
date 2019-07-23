//
//  EndpointTest.swift
//  CreditScoreTests
//
//  Created by Magnus Holm on 23/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CreditScore

class EndpointTest: XCTestCase {
    
    func testEndpointCreditInfoCreatesCorrectUrl() {
        let endpoint = Endpoint.creditInfo()
        let baseUrl = URL(string: "https://google.com")!
        let url = endpoint.makeUrl(with: baseUrl)
        let urlResultWithParams = URL(string: "https://google.com/values")!
        
        XCTAssertEqual(url, urlResultWithParams)
    }

}
