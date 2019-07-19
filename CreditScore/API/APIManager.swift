//
//  APIManager.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

enum API {
    static func buildRequest(http: HTTP) -> URLRequest {
        return URLRequest(url: http.url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: http.timeOut)
    }
}

protocol CreditInfoServiceType {
    func perform<T: Codable>(_ type: T.Type, request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
}

struct CreditInfoService: CreditInfoServiceType {
    func perform<T: Codable>(_ type: T.Type, request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { (result) in
            switch result {
            case .success(let response, let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidStatusCode))
                    return
                }
                do {
                    let values = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidEndpoint, invalidStatusCode, decodeError, apiError
}
