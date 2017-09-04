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
        mapView.setRegion(regionForAnnotations(annotations: mapView.annotations), animated: true)
        
    }
    
    
    //MARK - Map View Delegate
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        
        if mapView.annotations.count > 0 {
            mapView.setRegion(regionForAnnotations(annotations: mapView.annotations), animated: true)
        } else {
            mapView.setRegion(regionForUserLocation(), animated: true)
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
    
    //Usar este metodo para ubicar el mapa cerca del usuario
    func regionForUserLocation() -> MKCoordinateRegion {
        let userLocation = mapView.userLocation
        
        guard let coordinates = userLocation.location?.coordinate else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 0.0, longitude: 0.0),
                                      span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        }
        
        return MKCoordinateRegion(center: coordinates,
                                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    }
    
    //Usar este metodo para ubicar el mapa donde se encuentran los pines
    func regionForAnnotations(annotations: [MKAnnotation]) -> MKCoordinateRegion {
        
        var upper: CLLocationCoordinate2D = (annotations.first?.coordinate)!
        var lower: CLLocationCoordinate2D = (annotations.first?.coordinate)!
        
        for annotation in annotations {
            if(annotation.coordinate.latitude > upper.latitude) {
                upper.latitude = annotation.coordinate.latitude
            }
            if(annotation.coordinate.latitude < lower.latitude) {
                lower.latitude = annotation.coordinate.latitude
            }
            if(annotation.coordinate.longitude > upper.longitude) {
                upper.longitude = annotation.coordinate.longitude
            }
            if(annotation.coordinate.longitude < lower.longitude) {
                lower.longitude = annotation.coordinate.longitude
            }
        }
        
        // Busca la region
        var locationSpan = MKCoordinateSpanMake(0.0, 0.0)
        locationSpan.latitudeDelta = upper.latitude - lower.latitude
        locationSpan.longitudeDelta = upper.longitude - lower.longitude
        var locationCenter = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        locationCenter.latitude = (upper.latitude + lower.latitude) / 2
        locationCenter.longitude = (upper.longitude + lower.longitude) / 2
        
        let region = MKCoordinateRegionMake(locationCenter, locationSpan)
        return region;
        
    }
}
