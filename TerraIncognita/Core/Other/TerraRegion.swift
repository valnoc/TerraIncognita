//
//  TerraRegion.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import CoreLocation

// lat - vertical
// lon - horizontal
class TerraRegion {
    var topLeft: CLLocationCoordinate2D
    var topRight: CLLocationCoordinate2D
    var bottomLeft: CLLocationCoordinate2D
    var bottomRight: CLLocationCoordinate2D
    
    init(topLeft: CLLocationCoordinate2D,
         topRight: CLLocationCoordinate2D,
         bottomLeft: CLLocationCoordinate2D,
         bottomRight: CLLocationCoordinate2D) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
    
    func containsCoordinate(_ coordinate:CLLocationCoordinate2D) -> Bool {
        //TODO: search in trapezoid
        var latInside = false
        if topLeft.latitude < bottomLeft.latitude {
            latInside = coordinate.latitude >= topLeft.latitude && coordinate.latitude <= bottomLeft.latitude
        }
        else {
            latInside = coordinate.latitude >= bottomLeft.latitude && coordinate.latitude <= topLeft.latitude
        }
        
        var lonInside = false
        if topLeft.longitude < topRight.longitude {
            lonInside = coordinate.longitude >= topLeft.longitude && coordinate.longitude <= topRight.longitude
        }
        else {
            lonInside = coordinate.longitude >= topRight.longitude && coordinate.longitude <= topLeft.longitude
        }
        
        return latInside && lonInside
    }
}
