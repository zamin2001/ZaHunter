//
//  ViewController.swift
//  ZaHunter
//
//  Created by zamin ahmed on 3/11/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//Delegate means to report back to the view controller, in this case the CLLocation is reporting back or delegating to the ViewController/


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapview: MKMapView!
    let locationmanager = CLLocationManager()
    var region = MKCoordinateRegion()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.requestWhenInUseAuthorization()
        mapview.showsUserLocation = true
        locationmanager.delegate = self
        locationmanager.startUpdatingLocation()
        //Delegate allows access to new functions...usch as updating loction//
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.first!
        let center = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        region = MKCoordinateRegion(center:center, span: span)
        mapview.setRegion(region, animated:true)
    }
    
    
}
