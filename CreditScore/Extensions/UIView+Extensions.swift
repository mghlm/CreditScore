//
//  UIView+Extensions.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Helper method to setup constraints using autolayout
    ///
    /// - Parameters:
    ///   - top: Top constraints
    ///   - left: Left constraint
    ///   - bottom: Bottom constraint
    ///   - right: Right constraint
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Helper method to setup center alignment using auto layout
    ///
    /// - Parameters:
    ///   - centerX: Horizontal center alignment
    ///   - centerY: Vertical center alignment
    func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?) {
        if let x = centerX {
            centerXAnchor.constraint(equalTo: x).isActive = true
        }
        if let y = centerY {
            centerYAnchor.constraint(equalTo: y).isActive = true
        }
    }
}
