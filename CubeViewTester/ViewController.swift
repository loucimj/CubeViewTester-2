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
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create subviews for our cube view (in this case, five image views)
        
        let iv1 : EvaluationView = EvaluationView.fromNib()
        iv1.config(person: EvaluationView.Person("Abigail Lopez".uppercased(),"img1",0.0))
        let iv10 : EvaluationView = EvaluationView.fromNib()
        iv10.config(person: EvaluationView.Person("Marcos Buricchi".uppercased(),"item0",0.0))
        let iv2 : EvaluationView = EvaluationView.fromNib()
        iv2.config(person: EvaluationView.Person("Dario Lanati".uppercased(),"item1",0.0))
        let iv3 : EvaluationView = EvaluationView.fromNib()
        iv3.config(person: EvaluationView.Person("Lucrecia Fernandez".uppercased(),"item2",0.0))
        let iv4 : EvaluationView = EvaluationView.fromNib()
        iv4.config(person: EvaluationView.Person("Manuel Gomez D'Hers".uppercased(),"item3",0.0))
        let iv5 : EvaluationView = EvaluationView.fromNib()
        iv5.config(person: EvaluationView.Person("Javier Loucim".uppercased(),"item4",0.0))
        
        // Ad the subview to the cube view
        let iv6 : EvaluationView = EvaluationView.fromNib()
        iv6.config(person: EvaluationView.Person("Axel Abufalia".uppercased(),"item7",0.0))
        let iv7 : EvaluationView = EvaluationView.fromNib()
        iv7.config(person: EvaluationView.Person("Guibert Englebienne".uppercased(),"item5",0.0))
        let iv8 : EvaluationView = EvaluationView.fromNib()
        iv8.config(person: EvaluationView.Person("Martin Migoya".uppercased(),"item6",0.0))
        let iv9 : EvaluationView = EvaluationView.fromNib()
        iv9.config(person: EvaluationView.Person("Ignacio Peña".uppercased(),"item8",0.0))

        cubeView.addChildViews([iv1, iv6, iv7, iv8, iv9, iv2, iv3, iv4, iv5, iv10])
        
        topView.addGradient(direction: .down)
        bottomView.addGradient(direction: .up)
        
    }
}
