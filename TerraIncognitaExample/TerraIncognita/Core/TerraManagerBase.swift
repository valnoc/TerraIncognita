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
    var storage: TerraStorage
    
    required init(config:TerraManagerConfig) {
        storage = TerraStorage()
    }
    
    //MARK: - markers
    internal func reloadMarkers(_ markers:[TerraMarker]) {
        removeAllMarkers()
        addMarkers(markers)
        //TODO: update markers on terraView
    }
    
    //MARK: add markers
    internal func addMarker(_ marker: TerraMarker) {
        storage.addMarker(marker)
    }
    
    internal func addMarkers(_ markers: [TerraMarker]) {
        storage.addMarkers(markers)
    }
    
    //MARK: remove markers
    internal func removeMarker(_ markerId:String) {
        storage.removeMarker(markerId)
    }
    internal func removeMarkers(_ markerIds:[String]) {
        storage.removeMarkers(markerIds)
    }
    internal func removeAllMarkers() {
        storage.removeAllMarkers()
    }
}
