//
//  ViewController.swift
//  CubeViewTester
//
//  Created by Øyvind Hauge on 28/09/16.
//  Copyright © 2016 Oyvind Hauge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cubeView: OHCubeView!
    
    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create subviews for our cube view (in this case, five image views)
        
        let iv1 : EvaluationView = EvaluationView.fromNib()
        iv1.config(person: EvaluationView.Person("Abigail Lopez".uppercased(),"img1",0.0))
        let iv10 : EvaluationView = EvaluationView.fromNib()
        iv10.config(person: EvaluationView.Person("Marcos Buricchi".uppercased(),"item0",0.0))
        let iv2 : EvaluationView = EvaluationView.fromNib()
        iv2.config(person: EvaluationView.Person("Cristhian Alfaya Framolino".uppercased(),"item1",0.0))
        let iv3 : EvaluationView = EvaluationView.fromNib()
        iv3.config(person: EvaluationView.Person("Mike Dornbell".uppercased(),"item2",0.0))
        let iv4 : EvaluationView = EvaluationView.fromNib()
        iv4.config(person: EvaluationView.Person("Marty McFly".uppercased(),"item3",0.0))
        let iv5 : EvaluationView = EvaluationView.fromNib()
        iv5.config(person: EvaluationView.Person("Mr Somke".uppercased(),"item4",0.0))
        
        // Ad the subview to the cube view
        
        cubeView.addChildViews([iv1, iv2, iv3, iv4, iv5, iv10])
        
        
        let gradientMaskLayer:CAGradientLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.topView.frame
        gradientMaskLayer.colors = [UIColor.black.cgColor,UIColor.clear.cgColor ]
        gradientMaskLayer.locations = [0.0, 1.0]
        self.topView.layer.mask = gradientMaskLayer
        self.topView.backgroundColor = UIColor.black
        topView.alpha = 0.3
    }
}
