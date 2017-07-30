//
//  TerraViewMarker.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import MapKit

class AMapsViewMarker: NSObject, TerraViewMarker {
    var terra_markerId: String!
    var terra_reuseIdentifier: String?
    var terra_coordinate: CLLocationCoordinate2D!
}

extension AMapsViewMarker: MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        get{
            return terra_coordinate
        }
    }
}
