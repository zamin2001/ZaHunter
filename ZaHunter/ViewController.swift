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

class ViewController: UIViewController {
    
    @IBOutlet weak var mapview: MKMapView!
    let locationmanager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.requestWhenInUseAuthorization()
        mapview.showsUserLocation = true
    }
    
}
