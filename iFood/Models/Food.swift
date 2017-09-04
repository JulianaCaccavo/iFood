//
//  Food.swift
//  iFood
//
//  Created by Matias Fernandez on 08/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class Food: NSObject {

    var name = ""
    var foodDescription: String = ""
    var foodImage: String = ""
    var value: Float = 0
    
    init(_ dict: [String: Any]) {
        super.init()
        
        self.name = dict["name"] as! String
        self.foodImage = dict["foodImage"] as! String
        self.foodDescription = dict["foodDescription"] as! String
    }
    
}
