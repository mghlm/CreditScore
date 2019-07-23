//
//  CreditInfoResponseTest.swift
//  CreditScoreTests
//
//  Created by Magnus Holm on 23/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CreditScore

class CreditInfoResponseTest: XCTestCase {
    
    var creditInfoRespone: CreditInfo!
    var creditInfoReport: CreditReportInfo!

    override func setUp() {
        let reader = DataReader()
        let data = try! reader.readFile(named: "credit_report_info", ofType: "json")
        creditInfoRespone = try? JSONDecoder().decode(CreditInfo.self, from: data)
        creditInfoReport = creditInfoRespone.creditReportInfo
    }

    override func tearDown() {
        
    }
    
    func creditInfoReportExistence() {
        XCTAssertNotNil(creditInfoReport)
    }
    
    func testCreditReportInfoHasCorrectData() {
        XCTAssertEqual(creditInfoReport.score, 514)
        XCTAssertEqual(creditInfoReport.maxScoreValue, 700)
        XCTAssertEqual(creditInfoReport.minScoreValue, 0)
    }
}
