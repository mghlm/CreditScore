//
//  CreditInfo.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

struct CreditInfo: Decodable {
    let creditReportInfo: CreditReportInfo
}

struct CreditReportInfo: Decodable {
    let score: Int
    let maxScoreValue: Int
    let minScoreValue: Int
}
