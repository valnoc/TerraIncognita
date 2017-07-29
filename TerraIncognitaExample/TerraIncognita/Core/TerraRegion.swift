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
    
    init(center: CLLocationCoordinate2D,
         deltaLat: CLLocationDegrees,
         deltaLon: CLLocationDegrees) {
        self.center = center
        self.deltaLat = deltaLat
        self.deltaLon = deltaLon
    }
    
    func containsCoordinate(_ coordinate:CLLocationCoordinate2D) -> Bool {
        //TODO: implement check
        return false
    }    

//    //MARK: northWest & southEast
//    func makeNorthWestSouthEast() -> (CLLocationCoordinate2D, CLLocationCoordinate2D) {
//        return (makeNorthWest(), makeSouthEast())
//    }
//    
//    func makeNorthWest() -> CLLocationCoordinate2D {
//        return CLLocationCoordinate2D(latitude: center.latitude - deltaLat,
//                                      longitude: center.longitude + deltaLon)
//    }
//    
//    func makeSouthEast() -> CLLocationCoordinate2D {
//        return CLLocationCoordinate2D(latitude: center.latitude + deltaLat,
//                                      longitude: center.longitude - deltaLon)
//    }
}
