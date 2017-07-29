//
//  TerraManagerBase.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class TerraManagerBase: TerraManager {

    weak var delegate:TerraManagerDelegate?
    
    required init(config:TerraManagerConfig) {
    }
    
    //MARK: add markers
    internal func addMarker(_ marker: TerraMarker) {
        addMarkers([marker])
    }
    
    internal func addMarkers(_ markers: [TerraMarker]) {
        
    }
    
    //MARK: remove markers
    internal func removeMarker(_ markerId:String) {
        removeMarkers([markerId])
    }
    internal func removeMarkers(_ markerIds:[String]) {
        
    }
    internal func removeAllMarkers() {
        
    }
    
    //MARK: reload markers
    internal func reloadMarkers(_ markers:[TerraMarker]) {
        removeAllMarkers()
        addMarkers(markers)
        //TODO: call update terraView
    }
}
