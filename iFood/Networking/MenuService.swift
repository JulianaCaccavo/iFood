//
//  MenuService.swift
//  iFood
//
//  Created by Matias Fernandez on 12/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import Foundation

class MenuService {

    static func getMenu(_ responseHandler: @escaping ([Food])->Void, errorHandler: @escaping (_ error: String)->Void) {
        
        let url = URL(string: "https://api.myjson.com/bins/1essw")
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
                
                let foods = parseJsonArray(json)
                responseHandler(foods)
                
            }
            catch {
                //Devolver un error
                return
            }
        }
        
        task.resume()
    }
    
    //Suponiendo que obtengamos un array
    static func parseJsonArray(_ json: [Any]) -> [Food] {
        
        var foods = [Food]()
        
        for obj in json  {
            let food = Food(obj as! [String : Any])
            foods.append(food)
        }
        
        return foods
    }
    
}
