//
//  FoodParser.swift
//  iFood
//
//  Created by Matias Fernandez on 12/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import Foundation

struct FoodParser {
    
    //Suponiendo que obtengamos un array
    func parseJsonArray(array: [Any]) -> [Food] {
        
        var foods = [Food]()
        
        for obj in array  {
            let food = Food(obj as! [String : Any])
            foods.append(food)
        }
        
        return foods
    }
    
}
