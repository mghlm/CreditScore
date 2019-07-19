//
//  CreditInfoService.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

protocol CreditInfoServiceType {
    func fetchCreditInfo(completion: @escaping (CreditReportInfo) -> Void)
}

struct CreditInfoService: CreditInfoServiceType {
    func fetchCreditInfo(completion: @escaping (CreditReportInfo) -> Void) {
        
    }
}
