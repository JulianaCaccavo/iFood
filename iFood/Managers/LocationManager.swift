//
//  LocationManager.swift
//  iFood
//
//  Created by Matias Fernandez on 22/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

enum TrackingType {
    case Foreground, Background, Combined, None
}


class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = LocationManager()
    
    var delegate: LocationManagerDelegate?
    let manager = CLLocationManager()
    
    private override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = 1000 //Presición en metros
        manager.distanceFilter = 10 // Updates Cada 10
        requestPermission()
    }
 
    //MARK - Public Methods
    
    func updateTrackingMethod(_ type: TrackingType) {
        switch type {
        case .Foreground:
            stopBackgroundTracking()
            beginForegroundTracking()
        case .Background:
            stopForegroundTracking()
            beginBackgroundTracking()
        case .Combined:
            beginBackgroundTracking()
            beginForegroundTracking()
        case .None:
            stopForegroundTracking()
            stopBackgroundTracking()
        }
    }
    
    //MARK - Private Methods
    
    private func beginForegroundTracking() {
        manager.startUpdatingLocation()
    }
    
    private func stopForegroundTracking() {
        manager.stopUpdatingLocation()
    }
    
    private func beginBackgroundTracking() {
        manager.startMonitoringSignificantLocationChanges()
    }
    
    private func stopBackgroundTracking() {
        manager.stopMonitoringSignificantLocationChanges()
    }

    private func requestPermission() -> Void {
        checkAuth(CLLocationManager.authorizationStatus())
    }
    
    private func checkAuth(_ status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways:
            print("🛰 Tracking Authorized")
        case .authorizedWhenInUse:
            print("🛰 Tracking Authorized While Using")
        case .denied:
            print("🛰 Tracking Denied, Abort")
        case .notDetermined:
            print("🛰 Tracking Unknown, requesting permissions")
            manager.requestAlwaysAuthorization()
        case .restricted:
            print("🛰 Tracking Restricted, Abort")
        }
        
    }
    
    //MARK - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuth(status)
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        print("🛰 Resume Updates")
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("🛰 Pause Updates")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("🛰 Location Update \(locations)")
        decodeLocation(locations[0])
    }
    
    //MARK - Reverse Geocoding
    
    func decodeLocation(_ location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print("🌐 Reverse Geocoding failed with error: \(String(describing: error?.localizedDescription))")
            }
            
            if placemark == nil {
                print("🛰 No Location Obtained")
                return
            }
            
            let pms = placemark! as [CLPlacemark]
            
            if pms.count > 0 {
                let place = pms[0]
                print("🛰Decoded Location: \(String(describing: place.addressDictionary))")
                self.delegate?.didUpdateLocation(place)
            }
        }
    }

}


//Region Monitoring Extension
extension LocationManager {
 
    public func monitorRegion(_ region: CLRegion) {
        manager.startMonitoring(for: region)
    }
    
    public func stopMonitoringRegion(_ region: CLRegion) {
        manager.stopMonitoring(for: region)
    }
    
    //MARK - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("🛰 Entered Regions \(region)")
        
        //Notificar al usuario
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("🛰 Exit Region \(region)")
    }

    
}

public protocol LocationManagerDelegate: NSObjectProtocol {
    
    func didUpdateLocation(_ location: CLPlacemark)
    
}



