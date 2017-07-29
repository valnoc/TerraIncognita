//
//  TerraRegion.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import CoreLocation

class TerraRegion {
    var centerCoordinate: CLLocationCoordinate2D
    
    var deltaLon: CLLocationDegrees
    var deltaLat: CLLocationDegrees
    
    init(centerCoordinate: CLLocationCoordinate2D,
         deltaLon: CLLocationDegrees,
         deltaLat: CLLocationDegrees) {
        self.centerCoordinate = centerCoordinate
        self.deltaLon = deltaLon
        self.deltaLat = deltaLat
    }
}
