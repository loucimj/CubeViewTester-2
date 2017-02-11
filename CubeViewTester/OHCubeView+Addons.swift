//
//  OHCubeView+Addons.swift
//  CubeViewTester
//
//  Created by Cristopher Adan Bautista Gomez on 2/9/17.
//  Copyright © 2017 Oyvind Hauge. All rights reserved.
//

import UIKit

extension OHCubeView : UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is CosmosView {
            return false
        }
        return true
    }
}
