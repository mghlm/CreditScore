//
//  APIServiceMock.swift
//  CreditScoreTests
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation
@testable import CreditScore

final class APIServiceMock: APIServiceType {
    var isSucceded: Bool = true
    
    func perform<T: Codable>(_ type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)  {
        if isSucceded {
            let model = CreditInfo(creditReportInfo: CreditReportInfo(score: 173, maxScoreValue: 700, minScoreValue: 0)) as! T
            completion(.success(model))
        } else {
            completion(.failure(.apiError))
        }
    }
}
