//
//  TerraIncognitaFactory.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

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
    
}
