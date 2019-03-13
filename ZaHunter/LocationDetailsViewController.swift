//
//  LocationDetailsViewController.swift
//  ZaHunter
//
//  Created by zamin ahmed on 3/12/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit
import MapKit

class LocationDetailsViewController: UIViewController {
    var selectedMapItem = MKMapItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedMapItem.name!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
