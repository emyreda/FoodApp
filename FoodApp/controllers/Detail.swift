//
//  ViewController2.swift
//  FoodApp
//
//  Created by Mac on 7/3/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Detail: UIViewController {

    
    @IBOutlet weak var vc2image: UIImageView!
    @IBOutlet weak var vc2name: UILabel!
    @IBOutlet weak var vc2des: UITextView!
    
    
    var food:Food?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc2image.image = UIImage(named:(food?.image!)!)
        vc2name.text = food?.name!
        vc2des.text = food?.des!
        
    }
    
    
    
    
}

