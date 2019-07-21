//
//  APIManager.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

protocol APIServiceType {
    func perform<T: Codable>(_ type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class APIService: APIServiceType {
    
    private let baseUrl = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit")!
    private let session: URLSession
    private let transformer: Transformer
    
    init(session: URLSession = URLSession.shared, transformer: Transformer = JSONTransformer()) {
        self.session = session
        self.transformer = transformer
    }
    
    func perform<T: Codable>(_ type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let request = URLRequest(url: endpoint.makeUrl(with: baseUrl), cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: endpoint.timeOut)
        
        session.dataTask(with: request) { (result) in
            switch result {
            case .success(let response, let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidStatusCode))
                    return
                }
                do {
                    let values = try self.transformer.decode(T.self, from: data)
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
