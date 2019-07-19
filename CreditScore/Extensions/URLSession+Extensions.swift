//
//  URLSession+Extensions.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

// MARK: - Extensions for a cleaner way to use dataTask with Result type

extension URLSession {
    func dataTask(with request: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        })
    }
}
