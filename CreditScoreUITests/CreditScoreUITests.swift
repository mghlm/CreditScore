//
//  CreditScoreUITests.swift
//  CreditScoreUITests
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest

class CreditScoreUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    func testViewsOnHomeScreenExists() {
        let app = XCUIApplication()
        
        let mainLabel = app.staticTexts["mainLabelIdentifier"]
        let maxValueLabel = app.staticTexts["maxValueLabelIdentifier"]
        
        XCTAssertTrue(mainLabel.exists)
        XCTAssertTrue(maxValueLabel.exists)
    }
}
