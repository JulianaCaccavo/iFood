//
//  RestaurantService.swift
//  iFood
//
//  Created by Matias Fernandez on 29/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import Foundation

class RestaurantService {
    
    static func getRestaurante(_ responseHandler: @escaping ([Restaurant])->Void, errorHandler: @escaping (_ error: String)->Void) {
        
        let url = URL(string: "https://api.myjson.com/bins/mblnt")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                errorHandler(error!.localizedDescription)
                return
            }
            
            guard let responseData = data else {
                errorHandler("Response Data is nil")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: responseData, options: []) as! [Any]
                
                let restaurants = parseJsonArray(json)
                
                DispatchQueue.main.async {
                    // Update UI
                    responseHandler(restaurants)
                }
                
            }
            catch {
                //Devolver un error
                return
            }
        }
        
        task.resume()
    }
    
    //Suponiendo que obtengamos un array
    static func parseJsonArray(_ json: [Any]) -> [Restaurant] {
        
        var foods = [Restaurant]()
        
        for obj in json  {
            let food = Restaurant(obj as! [String : Any])
            foods.append(food)
        }
        
        return foods
    }
    
}
