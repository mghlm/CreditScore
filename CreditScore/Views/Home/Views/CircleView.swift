//
//  CircleView.swift
//  CreditScore
//
//  Created by Magnus Holm on 23/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class CircleView: UIView {
    
    // MARK: - Private properties
    
    private var shapeLayer: CAShapeLayer!
    private var trackLayer: CAShapeLayer!
    private var circularPath: UIBezierPath!
    private var startText: String?
    
    private var scoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center 
        lbl.font = UIFont.boldSystemFont(ofSize: 32)
        return lbl
    }()
    
    // MARK: - Init
    
    init(frame: CGRect, startText: String?) {
        super.init(frame: frame)
        self.startText = startText
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Public methods
    
    func animate(toValue: Double, maxValue: Double, minValue: Double = 0.0, duration: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = calculateEndValue(value: toValue, maxValue: maxValue)
        basicAnimation.duration = duration
        basicAnimation.fillMode = .forwards
        basicAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.strokeEnd = CGFloat(toValue)
        shapeLayer.add(basicAnimation, forKey: "strokeAnimation")
        
        var currentTime:Double = duration
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 64)
        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            if currentTime >= 2{
                timer.invalidate()
            } else {
                currentTime += 0.01
                let percent = currentTime/2
                self.scoreLabel.text = "\(Int(toValue * percent))"
            }
        }
        timer.fire()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        setupLabel()
        setupCircularPath()
        setupTrackLayer()
        setupShapeLayer()
    }
    
    private func setupLabel() {
        addSubview(scoreLabel)
        scoreLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        scoreLabel.center = center
        scoreLabel.text = startText ?? ""
    }
    
    private func setupCircularPath() {
        circularPath = UIBezierPath(arcCenter: center, radius: 150, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
    }
    
    private func setupTrackLayer() {
        trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 20
        trackLayer.strokeEnd = 1
        trackLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(trackLayer)
    }
    
    private func setupShapeLayer() {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    private func calculateEndValue(value: Double, maxValue: Double) -> CGFloat {
        return CGFloat((value / maxValue) * 0.8)
    }
}
