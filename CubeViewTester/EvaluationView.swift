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
        
        let rect = CGRect(x: image!.size.width * 0.25, y: image!.size.height*0.60, width: image!.size.width * 0.5, height: image!.size.height*0.3)
        print()
        
        
        if let imageAnalysis = image?.cropUsingRect(rect) {
            let imageColors = imageAnalysis.getColors()
            
            if imageColors.detailColor.isContrastingColor(compareColor: imageColors.backgroundColor) {
                starsRate.emptyBorderColor = imageColors.detailColor
                titleView.textColor = imageColors.detailColor
            } else if UIColor.white.isContrastingColor(compareColor: imageColors.backgroundColor) {
                starsRate.emptyBorderColor = UIColor.white
                titleView.textColor = UIColor.white
            } else {
                starsRate.emptyBorderColor = UIColor.black
                titleView.textColor = UIColor.black
            }
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
