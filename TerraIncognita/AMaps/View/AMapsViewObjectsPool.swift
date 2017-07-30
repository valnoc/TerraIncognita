//
//  TerraViewObjectsPool.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class AMapsViewObjectsPool: TerraViewObjectsPool {
    
    //MARK: viewMarkers
    override func makeViewMarker(_ markerId: String) -> TerraViewMarker {
        fatalError(debugMessage_notImplemented)
    }
}
