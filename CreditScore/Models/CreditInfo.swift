//
//  CreditInfo.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

struct CreditInfo: Codable {
    let accountIDVStatus: String
    let creditReportInfo: CreditReportInfo
    let dashboardStatus, personaType: String
    let coachingSummary: CoachingSummary
    let augmentedCreditScore: String?
}

struct CoachingSummary: Codable {
    let activeTodo, activeChat: Bool
    let numberOfTodoItems, numberOfCompletedTodoItems: Int
    let selected: Bool
}

struct CreditReportInfo: Codable {
    let score: Int
    let scoreBand: Int
    let clientRef: String
    let status: String
    let maxScoreValue: Int
    let minScoreValue: Int
    let monthsSinceLastDefaulted: Int
    let hasEverDefaulted: Bool
    let monthsSinceLastDelinquent: Int
    let hasEverBeenDelinquent: Bool
    let percentageCreditUsed: Int
    let percentageCreditUsedDirectionFlag: Int
    let changedScore: Int
    let currentShortTermDebt: Int
    let currentShortTermNonPromotionalDebt: Int
    let currentShortTermCreditLimit: Int
    let currentShortTermCreditUtilisation: Int
    let changeInShortTermDebt: Int
    let currentLongTermDebt: Int
    let currentLongTermNonPromotionalDebt: Int
    let currentLongTermCreditLimit: Int?
    let currentLongTermCreditUtilisation: Int?
    let changeInLongTermDebt: Int
    let numPositiveScoreFactors: Int
    let numNegativeScoreFactors: Int
    let equifaxScoreBand: Int
    let equifaxScoreBandDescription: String
    let daysUntilNextReport: Int
}
