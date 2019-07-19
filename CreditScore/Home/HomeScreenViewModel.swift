//
//  HomeScreenViewModel.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

protocol HomeScreenViewModelType {
    func getCreditInfo(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void)
}

final class HomeScreenViewModel: HomeScreenViewModelType {
    
    // MARK: - Dependenices
    
    private var apiService: APIServiceType!
    
    // MARK: - Private properties
    
    private var creditReportInfo: CreditReportInfo!
    
    // MARK: Init
    
    init(apiService: APIServiceType) {
        self.apiService = apiService
    }
    
    // MARK: - Public methods
    
//    func getCreditInfo() {
//        apiService.perform(CreditInfo.self, http: HTTP.creditInfo()) { [weak self] result in
//            switch result {
//            case .success(let creditInfo):
//                DispatchQueue.main.async {
//                    self?.creditReportInfo = creditInfo.creditReportInfo
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
    
    func getCreditInfo(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void) {
        apiService.perform(CreditInfo.self, http: HTTP.creditInfo()) { (result) in
            switch result {
            case .success(let creditInfo):
                DispatchQueue.main.async {
                    completion(.success(creditInfo.creditReportInfo))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
