//
//  HTTP.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
}

// MARK: - HTTP

struct HTTP {
    let path: String
    let method: HTTPMethod
    let timeOut: Double = 30
}

// MARK: - Extensions

// Endpoints
extension HTTP {
    static func creditInfo() -> HTTP {
        return HTTP(path: "/values", method: .GET)
    }
}

// QUESTION: WHY CAN WE UNWRAP HERE??

// Url
extension HTTP {
    var url: URL {
        let baseUrl = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit")!
        let urlWithPath = baseUrl.appendingPathComponent(path)
        let components = URLComponents(url: urlWithPath, resolvingAgainstBaseURL: false)!
        
        return components.url!
    }
}
