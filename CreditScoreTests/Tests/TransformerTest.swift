//
//  TransformerTest.swift
//  CreditScoreTests
//
//  Created by Magnus Holm on 25/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CreditScore

class TransformerTest: XCTestCase {
    
    var mockCreditReportInfoObject = CreditReportInfo(score: 514, maxScoreValue: 700, minScoreValue: 0)
    
    var transformer: Transformer!
    var reader: DataReader!

    override func setUp() {
        transformer = JSONTransformer()
        reader = DataReader()
    }
    
    func testJSONTransformerReturnsCorrectObject() {
        let data = try! reader.readFile(named: "credit_report_info", ofType: "json")
        guard let creditReportInfoObject = try? transformer.decode(CreditReportInfo.self, from: data) else { return }
        
        XCTAssertEqual(creditReportInfoObject.score, mockCreditReportInfoObject.score)
        XCTAssertEqual(creditReportInfoObject.maxScoreValue, mockCreditReportInfoObject.maxScoreValue)
        XCTAssertEqual(creditReportInfoObject.minScoreValue, mockCreditReportInfoObject.minScoreValue)
    }
}
