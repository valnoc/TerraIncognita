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
    var viewObjectsPool: TerraViewObjectsPool
    var updateViewQueue:DispatchQueue
    
    init(config:TerraManagerConfig) {
        storage = TerraStorage()
        updateViewQueue = DispatchQueue(label: "TerraManagerBase_updateViewQueue")
        viewObjectsPool = TerraViewObjectsPool()
    }
    
    //MARK: - markers
    func reloadMarkers(_ newMarkers:[TerraMarker]) {
        storage.reloadMarkers(newMarkers) { [weak self] (markers) in
            guard let __self = self else { return }
            __self.updateViewMarkersOnTerraView(markers)
        }
    }
    
    func reloadMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String]) {
        storage.reloadMarkers(add: markersToAdd, remove: markerIdsToRemove) { [weak self] (markers) in
            guard let __self = self else { return }
            __self.updateViewMarkersOnTerraView(markers)
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
    
    fileprivate func updateViewMarkersOnTerraView(_ markers:[TerraMarker]) {
        updateViewQueue.async { [weak self] in
            guard let __self = self else { return }
            guard let terraView = __self.terraView else { return }
            
            let region = terraView.currentRegion()
            let markersInside = markers.filter({ region.containsCoordinate($0.coordinate) })
            
            __self.showActualViewMarkersOnTerraView(markersInside)
        }
    }
    
    fileprivate func showActualViewMarkersOnTerraView(_ actualMarkers:[TerraMarker]) {
        var actualViewMarkers:[TerraViewMarker] = []
        for item in actualMarkers {
            actualViewMarkers.append(viewObjectsPool.dequeueReusableViewMarker(item._id))
        }
        
        let otherViewMarkers:[TerraViewMarker] = viewObjectsPool.otherUsedViewMarkers(actualViewMarkers)
        viewObjectsPool.enqueueReusableViewMarkers(otherViewMarkers)
        
        if let terraView = terraView {
            terraView.updateViewMarkers(add: actualViewMarkers,
                                        remove: otherViewMarkers)
        }
    }
}
