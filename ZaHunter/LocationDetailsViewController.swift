    //
    //  LocationDetailsViewController.swift
    //  ZaHunter
    //
    //  Created by zamin ahmed on 3/12/19.
    //  Copyright © 2019 zamin ahmed. All rights reserved.
    //
    
    import UIKit
    import MapKit
    import SafariServices
    class LocationDetailsViewController: UIViewController {
        
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var addressLabel: UILabel!
        @IBOutlet weak var phoneLabel: UILabel!
        
        
        
        
        var selectedMapItem = MKMapItem()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            print(selectedMapItem.name!)
            // Do any additional setup after loading the view.
        }
        
        override func viewWillAppear(_ animated: Bool) {
            nameLabel.text = selectedMapItem.placemark.name
            var address  = selectedMapItem.placemark.subThoroughfare! + " "
            address += selectedMapItem.placemark.thoroughfare! + "\n"
            address += selectedMapItem.placemark.locality! + ","
            address += selectedMapItem.placemark.administrativeArea! + " "
            address += selectedMapItem.placemark.postalCode!
            addressLabel.text = address
            phoneLabel.text = selectedMapItem.phoneNumber
        }
        
        @IBAction func onDirectionsButtonTapped(_ sender: Any) {
            
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
            MKMapItem.openMaps(with:[selectedMapItem], launchOptions: launchOptions)
        }
        
        @IBAction func onWebsiteButtonTapped(_ sender: UIButton) {
            if let url = selectedMapItem.url{
                present(SFSafariViewController(url:url),animated:true)
            }
        }
    }
