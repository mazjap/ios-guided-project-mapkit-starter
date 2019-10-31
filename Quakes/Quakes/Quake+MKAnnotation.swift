//
//  Quake+MKAnnotation.swift
//  Quakes
//
//  Created by Jordan Christensen on 11/1/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import MapKit

extension Quake: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var title: String? {
        place
    }
    
    var subtitle: String? {
        "Magnitude \(magnitude)"
    }
}
