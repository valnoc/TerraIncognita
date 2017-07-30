//
//  TerraIncognitaFactory.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import CoreLocation

enum TerraIncogintaSource {
    case AMaps
}

class TerraIncognitaFactory {

    func makeTerraManager(source:TerraIncogintaSource, config:TerraManagerConfig) -> TerraManager {
        switch source {
        case .AMaps:
            return AMapsManagerObj(config: config as! AMapsManagerConfig)
        }
    }
    
    func makeTerraMarker(_id: String, coordinate: CLLocationCoordinate2D) -> TerraMarker {
        return TerraMarker(_id: _id, coordinate: coordinate)
    }
    
}
