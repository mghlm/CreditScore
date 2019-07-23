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
    
    lazy var mainLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your credit score:"
        lbl.font = UIFont.boldSystemFont(ofSize: 32)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    lazy var maxValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 32)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    lazy var circularProgressView: CircleView = {
        let cv = CircleView(frame: .zero, startText: "Tap")
        cv.center = view.center
        
        return cv
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
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
        [mainLabel, circularProgressView, maxValueLabel].forEach { view.addSubview($0) }
        setupCreditScoreLabel()
        setupConstraints()
        setupAccessibility()
    }
    
    private func setupCreditScoreLabel() {
        guard let maxScore = viewModel.maxScore else { return }
        maxValueLabel.text = "of \(maxScore)"
    }
    
    private func setupAccessibility() {
        mainLabel.accessibilityIdentifier = "mainLabelIdentifier"
        maxValueLabel.accessibilityIdentifier = "maxValueLabelIdentifier"
        circularProgressView.isAccessibilityElement = true
        circularProgressView.accessibilityIdentifier = "circularProgressViewIdentifier"
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
        mainLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 150, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        maxValueLabel.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 150, paddingRight: 0, width: 0, height: 0)
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
