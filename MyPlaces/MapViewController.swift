//
//  MapViewController.swift
//  MyPlaces
//
//  Created by Artur Anissimov on 26.01.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var place: Place!
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPlacemark()
    }

    @IBAction func closeVC() {
        // Close view controller and unload it from memory
        dismiss(animated: true)
    }
    
    private func setupPlacemark() {
        
        // Get and then check location
        guard let location = place.location else { return }
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            // Check if we have errors
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.place.name
            annotation.subtitle = self.place.type
            
            guard let placemarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placemarkLocation.coordinate
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true) // Select our location mark
            
        }
    }
    
}
