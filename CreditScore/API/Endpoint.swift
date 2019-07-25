//
//  Endpoint.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
}

struct Endpoint {
    let path: String
    let method: HTTPMethod
    
    // makeUrl
    func makeUrl(with baseUrl: URL) -> URL {
        let url = baseUrl.appendingPathComponent(path)
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false), let componentsUrl = components.url else { return url }
        return componentsUrl
    }
}

// MARK: - Extensions

extension Endpoint {
    static func creditInfo() -> Endpoint {
        return Endpoint(path: "/values", method: .GET)
    }
}
