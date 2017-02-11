//
//  EvaluationView.swift
//  CubeViewTester
//
//  Created by Cristopher Adan Bautista Gomez on 2/9/17.
//  Copyright © 2017 Oyvind Hauge. All rights reserved.
//

import UIKit

@IBDesignable class EvaluationView: UIView {

    typealias Person = (name:String, imageNamed:String, rate:Double)
    
    // Our custom view from the XIB file
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var starsRate : CosmosView!
    @IBOutlet weak var titleView : UILabel!
    
    var selectedImageColors = UIImageColors()
    var person : Person?
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        
    }
    
    func config(person: Person){
        
        let image = UIImage.init(named: person.imageNamed)
        
        
        backgroundImage.image = image
        starsRate.rating = person.rate
        titleView.text = person.name
        
        print(CGRect(x: 0, y: backgroundImage.frame.height*0.8, width: backgroundImage.frame.width, height: backgroundImage.frame.height*0.15))
        
        
        if let imageAnalysis = image?.cropUsingRect(CGRect(x: 80, y: image!.size.height*0.75, width: 200, height: image!.size.height*0.2)) {
            let imageColors = imageAnalysis.getColors() 
            starsRate.emptyBorderColor = imageColors.detailColor
            titleView.textColor = imageColors.detailColor
        } else {
            starsRate.emptyBorderColor = UIColor.white
            titleView.textColor = UIColor.white
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
    }
}
