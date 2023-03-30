//
//  ViewController2.swift
//  postApi
//
//  Created by R & W on 29/03/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var country: UIImageView!
    @IBOutlet weak var mudra: UIImageView!
    @IBOutlet weak var countryNameOutlet: UILabel!
    @IBOutlet weak var populationOutlet: UILabel!
    
    
    @IBOutlet weak var cornPop: UILabel!
    @IBOutlet weak var conCor: UILabel!
    
    
   
    
    var counttyName = ""
    var countryImg = UIImage()
    var population = ""
    var mudraImg = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryNameOutlet.text = counttyName
        populationOutlet.text = population
        country.image = countryImg
        mudra.image = mudraImg

        
    }
    

  

}
