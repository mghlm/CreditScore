//
//  CreditInfo.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

struct CreditInfo: Codable {
    let creditReportInfo: CreditReportInfo
}

struct CreditReportInfo: Codable {
    let score: Int
    let maxScoreValue: Int
    let minScoreValue: Int
}
