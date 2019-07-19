//
//  HomeScreenViewController.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class HomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiService: APIServiceType = APIService()
        
        apiService.perform(CreditInfo.self, http: HTTP.creditInfo()) { [weak self] result in
            switch result {
            case .success(let creditInfo):
                DispatchQueue.main.async {
                    print(creditInfo.accountIDVStatus)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
