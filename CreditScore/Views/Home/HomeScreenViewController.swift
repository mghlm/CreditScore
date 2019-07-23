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
    
    // MARK: - Private propreties
    
    lazy var circularProgressView: CircleView = {
        let cv = CircleView(frame: .zero, startText: "Tap me")
        cv.center = view.center
        
        return cv
    }()
    
    lazy private var creditScoreLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        creditScoreLabel.isHidden = true 
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateCircularView)))
        viewModel.didLoad { [weak self] result in
            switch result {
            case .success:
                self?.setupUI()
            case .failure(let error):
                self?.showErrorAlert(for: error)
            }
        }
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
        view.addSubview(creditScoreLabel)
        view.addSubview(circularProgressView)
        setupCreditScoreLabel()
        setupConstraints()
    }
    
    private func setupCreditScoreLabel() {
        if let score = viewModel.score, let maxScore = viewModel.maxScore {
            creditScoreLabel.text = "Your score is: \(score) out of \(maxScore)"
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
    
    private func setupConstraints() {
        creditScoreLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    // Handlers
    
    @objc private func animateCircularView() {
        guard let score = viewModel.score,
              let scoreDouble = Double(score),
              let maxScore = viewModel.maxScore,
              let maxScoreDouble = Double(maxScore) else { return }
        
        circularProgressView.animate(toValue: scoreDouble, maxValue: maxScoreDouble, duration: 1)
    }
}
