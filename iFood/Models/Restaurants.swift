//
//  Restaurants.swift
//  iFood
//
//  Created by Matias Fernandez on 29/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import Foundation
import MapKit

class Restaurant: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate = CLLocationCoordinate2D ()
    var imgURL = ""

    
    init(_ dict: [String: Any]) {
        super.init()
        
        self.title = dict["name"] as? String
        self.subtitle = dict["tipoComida"] as? String
        
        if let latLong = dict["coordenadas"] as! [Double]? {
            self.coordinate.latitude = latLong[0]
            self.coordinate.longitude = latLong[1]
        }
        
        self.imgURL = dict["imgUrl"] as! String
    }
    
}
