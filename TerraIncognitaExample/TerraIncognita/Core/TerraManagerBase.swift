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
    var updateViewQueue:DispatchQueue
    
    var currentViewMarkers:[TerraMarker]
    
    required init(config:TerraManagerConfig) {
        storage = TerraStorage()
        updateViewQueue = DispatchQueue(label: "TerraManagerBase")
        currentViewMarkers = []
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
    
    fileprivate func updateViewMarkers(_ newMarkers:[TerraMarker]) {
        updateViewQueue.sync { [weak self] in
            guard let __self = self else { return }
            guard let terraView = __self.terraView else { return }
            
            let region = terraView.currentRegion()
            let markersInside = newMarkers.filter({ region.containsCoordinate($0.coordinate) })
            
            //TODO: decide, what to add/remove
        }
    }
    
    func updateViewMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String]) {
        //TODO: implement
    }
    
    //MARK: - debug
    fileprivate let debugMessage_notSupported = "Selected terra manager does not support this function"
    fileprivate let debugMessage_notImplemented = "Critical error! This function is not implemented"
}
