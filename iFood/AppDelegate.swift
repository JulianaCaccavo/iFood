//
//  AppDelegate.swift
//  iFood
//
//  Created by Matias Fernandez on 08/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        LocationManager.sharedInstance.updateTrackingMethod(.Combined)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        LocationManager.sharedInstance.updateTrackingMethod(.Background)
        
        let region = CLCircularRegion(center: CLLocationCoordinate2D.init(latitude: -45, longitude: -54),
                                      radius: 100, identifier: "Home")
        LocationManager.sharedInstance.monitorRegion(region)
    }

    
    func applicationWillEnterForeground(_ application: UIApplication) {
        LocationManager.sharedInstance.updateTrackingMethod(.Foreground)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        LocationManager.sharedInstance.updateTrackingMethod(.Foreground)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        LocationManager.sharedInstance.updateTrackingMethod(.None)
    }

}

