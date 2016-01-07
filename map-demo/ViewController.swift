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
        
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
        
    }
    
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        print("Gesture Recognized")
        
        //Location of where the user pressed for the gesture to be recognized
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        //Convert to a coordinate
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New location"
        
        annotation.subtitle = "Locating new places through gestures is straight forward."
        
        map.addAnnotation(annotation)
        
        
        
        
        
    }
    
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

