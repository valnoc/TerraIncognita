//
//  TerraViewObjectsPool.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import MapKit

class GMapsViewObjectsPool: TerraViewObjectsPool {
    
    //MARK: viewMarkers
    override func makeViewMarker(_ markerId: String, reuseIdentifier: String?) -> TerraViewMarker {
        let viewMarker = GMapsViewMarker()
        viewMarker.terra_markerId = markerId
        viewMarker.terra_reuseIdentifier = reuseIdentifier
        return viewMarker
    }
}
