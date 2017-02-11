//
//  UIView+MaskGradient.swift
//  CubeViewTester
//
//  Created by Javier Loucim on 2/11/17.
//  Copyright © 2017 Oyvind Hauge. All rights reserved.
//

import Foundation
import UIKit

enum GradientDirection {
    case up
    case down
}

protocol Gradientable {
    
}

extension Gradientable where Self: UIView {
    func addGradient(direction:GradientDirection, color:UIColor = UIColor.black) {
        let gradientMaskLayer:CAGradientLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        
        if direction == .down {
            gradientMaskLayer.colors = [UIColor.black.cgColor,UIColor.clear.cgColor]
        } else {
            gradientMaskLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        }
        gradientMaskLayer.locations = [0.0, 1.0]
        self.layer.mask = gradientMaskLayer
        
        self.backgroundColor = color
        self.alpha = 0.3
    }
}

extension UIView: Gradientable {
    
}
