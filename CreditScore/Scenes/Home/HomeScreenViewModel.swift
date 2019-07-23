//
//  HomeScreenViewModel.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

protocol HomeScreenViewModelType {
    
    /// Gets the decoded credit info object
    ///
    /// - Parameter completion: completes with either credit report info object or network error
    func didLoad(completion: @escaping (Result<Void, NetworkError>) -> Void)
    
    /// The user's credit score
    var score: String? { get }
    
    /// The max credit score
    var maxScore: String? { get }
    
}

final class HomeScreenViewModel: HomeScreenViewModelType {
    
    // MARK: - Dependenices
    
    private var apiService: APIServiceType!
    var score: String?
    var maxScore: String?
    
    // MARK: - Private properties
    
    private var creditReportInfo: CreditReportInfo!
    
    // MARK: Init
    
    init(apiService: APIServiceType) {
        self.apiService = apiService
    }
    
    // MARK: - Public methods
    
    func didLoad(completion: @escaping (Result<Void, NetworkError>) -> Void) {
        apiService.perform(CreditInfo.self, endpoint: Endpoint.creditInfo()) { [weak self] result in
            switch result {
            case .success(let creditInfo):
                DispatchQueue.main.async {
                    self?.score = "\(creditInfo.creditReportInfo.score)"
                    self?.maxScore = "\(creditInfo.creditReportInfo.maxScoreValue)"
                    completion(.success(()))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}


