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
    func reloadMarkers(_ newMarkers:[TerraMarker]) {
        storage.reloadMarkers(newMarkers) { [weak self] (markers) in
            guard let __self = self else { return }
            __self.updateViewMarkers(markers)
        }
    }
    
    func reloadMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String]) {
        storage.reloadMarkers(add: markersToAdd, remove: markerIdsToRemove) { [weak self] (markers) in
            guard let __self = self else { return }
            __self.updateViewMarkers(markers)
        }
    }
    
    //MARK: - view
    var terraView: TerraView? {
        get{
            return view
        }
    }
    
    func makeTerraView() -> TerraView {
        fatalError(debugMessage_notImplemented)
    }
    
    func updateView(markers:[TerraMarker]) {
        
    }
    
    //MARK: - debug
    fileprivate let debugMessage_notSupported = "Selected terra manager does not support this function"
    fileprivate let debugMessage_notImplemented = "Critical error! This function is not implemented"
}
