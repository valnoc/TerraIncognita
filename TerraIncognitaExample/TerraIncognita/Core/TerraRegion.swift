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
    var center: CLLocationCoordinate2D
    
    var deltaLat: CLLocationDegrees
    var deltaLon: CLLocationDegrees
    
    var northWest: CLLocationCoordinate2D
    var southEast: CLLocationCoordinate2D
    
    init(center: CLLocationCoordinate2D,
         deltaLat: CLLocationDegrees,
         deltaLon: CLLocationDegrees) {
        self.center = center
        self.deltaLat = deltaLat
        self.deltaLon = deltaLon
        
        self.northWest = CLLocationCoordinate2D(latitude: center.latitude - deltaLat,
                                                longitude: center.longitude + deltaLon)
        self.southEast = CLLocationCoordinate2D(latitude: center.latitude + deltaLat,
                                                longitude: center.longitude - deltaLon)
    }
    
    func containsCoordinate(_ coordinate:CLLocationCoordinate2D) -> Bool {
        return coordinate.latitude >= northWest.latitude && coordinate.latitude <= southEast.latitude &&
            coordinate.longitude >= southEast.longitude && coordinate.longitude <= northWest.longitude
    }
    
    //MARK: northWest & southEast
    fileprivate func makeNorthWestSouthEast() -> (CLLocationCoordinate2D, CLLocationCoordinate2D) {
        return (makeNorthWest(), makeSouthEast())
    }
    
    fileprivate func makeNorthWest() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: center.latitude - deltaLat,
                                      longitude: center.longitude + deltaLon)
    }
    
    fileprivate func makeSouthEast() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: center.latitude + deltaLat,
                                      longitude: center.longitude - deltaLon)
    }
}
