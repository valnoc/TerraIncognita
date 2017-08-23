//
//  TerraRegion+AMaps.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 20/08/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import MapKit

extension TerraRegion {
    convenience init(mkCoordinateRegion: MKCoordinateRegion) {
        let center = mkCoordinateRegion.center
        let deltaLat = mkCoordinateRegion.span.latitudeDelta
        let deltaLon = mkCoordinateRegion.span.longitudeDelta
        
        self.init(topLeft: CLLocationCoordinate2D(latitude: center.latitude + deltaLat,
                                                  longitude: center.longitude - deltaLon),
                  topRight: CLLocationCoordinate2D(latitude: center.latitude + deltaLat,
                                                   longitude: center.longitude + deltaLon),
                  bottomLeft: CLLocationCoordinate2D(latitude: center.latitude - deltaLat,
                                                     longitude: center.longitude - deltaLon),
                  bottomRight: CLLocationCoordinate2D(latitude: center.latitude - deltaLat,
                                                      longitude: center.longitude + deltaLon))
    }
}
