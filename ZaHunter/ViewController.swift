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


class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate{
    
    @IBOutlet weak var mapview: MKMapView!
    
    let locationmanager = CLLocationManager()
    var region = MKCoordinateRegion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.requestWhenInUseAuthorization()
        mapview.showsUserLocation = true
        locationmanager.delegate = self
        locationmanager.startUpdatingLocation()
        mapview.delegate = self
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
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "pizza"
        request.region = region
        let search = MKLocalSearch(request:request)
        search.start { (response,error) in
            if let  response = response {
                for mapItem in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = mapItem.placemark.coordinate
                    annotation.title = mapItem.name
                    self.mapview.addAnnotation(annotation)
                }
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pinView")
            pinView?.canShowCallout = true
            pinView?.rightCalloutAccessoryView = UIButton(type:.infoLight)
        }
        else {
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "ShowLocationDetailsSegue", sender:nil)
    }
}



