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
    var view: TerraView?
    
    required init(config:TerraManagerConfig) {
        storage = TerraStorage()
    }
    
    //MARK: - markers
    internal func reloadMarkers(_ newMarkers:[TerraMarker]) {
        storage.reloadMarkers(newMarkers) { (markers) in
            //TODO: update view
        }
    }
    
    internal func reloadMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String]) {
        storage.reloadMarkers(add: markersToAdd, remove: markerIdsToRemove) { (markers) in
            //TODO: update view
        }
    }
    
    //MARK - view
    var terraView: TerraView? {
        get{
            return view
        }
    }
    
    func makeTerraView() -> TerraView {
        fatalError("makeTerraView() must be overrided")
    }
}
