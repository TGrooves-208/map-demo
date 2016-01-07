//
//  ViewController.swift
//  map-demo
//  Dawson's Coffee Roaster's is the set coordinates for the location
//  Created by Gil Aguilar on 1/5/16.
//  Copyright © 2016 toplevel. All rights reserved.
//  A quick way of locking in some coordinates for a specific location

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //43.607745, -116.212378
        
        //Using let as opposed to var due to the coordinates being a constant
        let latitude:CLLocationDegrees = 43.607745
        
        let longitude:CLLocationDegrees = -116.212378
        
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Dawsons Taylor Coffee Roasters"
        
        annotation.subtitle = "Boise's best coffee roaster hands down"
        
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

