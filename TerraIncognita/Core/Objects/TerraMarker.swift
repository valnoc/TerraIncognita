//
//  TerraMarker.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import CoreLocation

class TerraMarker {
    var _id: String
    var coordinate: CLLocationCoordinate2D
    var reuseIdentifier: String?
    
    init(_id: String,
         coordinate: CLLocationCoordinate2D) {
        self._id = _id
        self.coordinate = coordinate
    }
}
