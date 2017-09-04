//
//  MapViewController.swift
//  iFood
//
//  Created by Matias Fernandez on 24/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var restaurants:[Restaurant]?
    
    override func viewDidLoad() {
        
        RestaurantService.getRestaurante({ (restaurants) in
            
            self.restaurants = restaurants
            self.addAnnotations(restaurants)
            
        }) { (errorString) in
            //Display error
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK - Private Methods
    
    func addAnnotations(_ restaurants: [Restaurant]) {
        
        mapView.addAnnotations(restaurants) //se agregan directamente ya que nuestra clase implementa el protocolo MKAnnotation
        
    }
    
    
    //MARK - Map View Delegate
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        
        let userLocation = mapView.userLocation
        
        if let coordinates = userLocation.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinates,
                                            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            mapView.setRegion(region, animated: true)
        }
        
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
    
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        
    }
    
    //MARK - Annotation configuration
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is Restaurant) {
            return nil
        }
        
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation") as? MKPinAnnotationView {
         
            view.canShowCallout = true // Muestra información cuando se hace click
            view.pinTintColor = UIColor.darkGray //
            view.animatesDrop = true //Animar cuando se ubica el pin
            
            return view
            
        }
        return nil
    }
}
