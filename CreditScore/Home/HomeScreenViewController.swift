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
        
        let creditInfoService: CreditInfoServiceType = CreditInfoService()
        
        creditInfoService.perform(CreditInfo.self, request: API.buildRequest(http: HTTP.creditInfo())) { [weak self] result in
            switch result {
            case .success(let creditInfo):
                print(creditInfo.accountIDVStatus)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
