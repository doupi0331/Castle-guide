//
//  ViewController.swift
//  Castle guide
//
//  Created by Yi-Yun Chen on 2017/11/8.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mkMap: MKMapView!
    var address = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hotel = HOTELS[self.view.tag]
        address = hotel.address
        name = hotel.name
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                // 取第一個座標
                let placemark = placemarks[0]
                
                // 加上標註
                let annotation = MKPointAnnotation()
                annotation.title = self.name
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    self.mkMap.showAnnotations([annotation], animated: true)
                    self.mkMap.selectAnnotation(annotation, animated: true)
                    
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

