//
//  EarthquakesViewController.swift
//  iOS8-Quakes
//
//  Created by Paul Solt on 10/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit
import MapKit

class EarthquakesViewController: UIViewController, MKMapViewDelegate {
    
    let quakesFetcher = QuakeFetcher()
		
	@IBOutlet var mapView: MKMapView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
        
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "QuakeView")
		
        fetchQuakes()
	}
    
    private func fetchQuakes() {
        quakesFetcher.fetchQuakes { (quakes, error) in
            if let error = error {
                NSLog("Error fetching quakes: \(error)")
            } else if let quakes = quakes {
                print(quakes.count)
                DispatchQueue.main.async {
                    self.mapView.addAnnotations(quakes)
                    
                    guard let largestQuake = quakes.first else { return }
                    
                    let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
                    let region = MKCoordinateRegion(center: largestQuake.coordinate, span: span)
                    self.mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
