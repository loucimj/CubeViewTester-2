//
//  UIView+NibLoable.swift
//  CubeViewTester
//
//  Created by Cristopher Adan Bautista Gomez on 2/9/17.
//  Copyright © 2017 Oyvind Hauge. All rights reserved.
//

import UIKit
extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
