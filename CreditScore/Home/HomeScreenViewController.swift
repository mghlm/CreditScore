//
//  HomeScreenViewController.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class HomeScreenViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private var viewModel: HomeScreenViewModelType!
    
    // MARK: - Private properties
    
    private var creditInfo: CreditReportInfo!
    
    lazy var creditScoreLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCreditInfo()
    }
    
    // MARK: - Init
    
    init(viewModel: HomeScreenViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.backgroundColor = .white 
        view.addSubview(creditScoreLabel)
        setupCreditScoreLabel()
        
        setupConstraints()
    }
    
    private func fetchCreditInfo() {
        viewModel.getCreditInfo { (result) in
            switch result {
            case .success(let creditInfo):
                self.creditInfo = creditInfo
                self.setupUI()
            case .failure(let error):
                self.showErrorAlert(for: error)
            }
        }
    }
    
    private func showErrorAlert(for error: NetworkError) {
        var errorText = ""
        switch error {
        case .apiError:
            errorText = "Api error"
        case .decodeError:
            errorText = "JSON error"
        case .invalidEndpoint:
            errorText = "Endpoint error"
        case .invalidStatusCode:
            errorText = "Bad status code"
        }
        
        let alert = UIAlertController(title: "Error", message: errorText, preferredStyle: .alert)
        present(alert, animated: true)
    }
    
    private func setupCreditScoreLabel() {
        creditScoreLabel.text = "Your score is: \(creditInfo.score) out of \(creditInfo.maxScoreValue)"
    }
    
    private func setupConstraints() {
        creditScoreLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
