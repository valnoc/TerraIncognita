//
//  TerraStorage.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

typealias TerraStorageUpdateCompletion = (_ markers:[TerraMarker]) -> Void
//typealias TerraStorageMarkersCompletion = (_ markers:[TerraMarker]) -> Void

class TerraStorage {
    fileprivate var markers:[TerraMarker]
    
    fileprivate var queue:DispatchQueue
    
    init() {
        markers = []
        
        queue = DispatchQueue(label: "TerraStorage_queue", qos:.userInitiated)
    }
    
    //MARK: markers
    internal func reloadMarkers(_ newMarkers:[TerraMarker], completion: @escaping TerraStorageUpdateCompletion) {
        queue.async { [weak self] in
            guard let __self = self else { return }
            __self.markers.removeAll()
            __self.markers.append(contentsOf: newMarkers)
            
            completion(__self.markers)
        }
    }
    
    internal func reloadMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String], completion: @escaping TerraStorageUpdateCompletion) {
        queue.async { [weak self] in
            guard let __self = self else { return }
            __self.removeMarkers(markerIdsToRemove)
            __self.markers.append(contentsOf: markersToAdd)
            
            completion(__self.markers)
        }
    }

    fileprivate func removeMarkers(_ markerIds:[String]) {
        for item in markerIds {
            removeMarker(item)
        }
    }
    fileprivate func removeMarker(_ markerId:String) {
        let markerIndex = markers.index { $0._id == markerId }
        guard let index = markerIndex else { return }
        markers.remove(at: index)
    }

}
