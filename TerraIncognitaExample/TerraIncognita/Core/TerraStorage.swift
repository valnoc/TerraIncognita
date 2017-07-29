//
//  TerraStorage.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class TerraStorage {
    fileprivate var markers:[TerraMarker]
    
    fileprivate var queue:DispatchQueue
    
    init() {
        markers = []
        
        queue = DispatchQueue(label: "TerraStorage_queue")
    }
    
    //MARK: add markers
    internal func reloadMarkers(_ newMarkers:[TerraMarker]) {
        queue.async { [weak self] in
            guard let __self = self else { return }
            __self.markers.removeAll()
            __self.markers.append(contentsOf: newMarkers)
        }
    }
    
    internal func reloadMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String]) {
        queue.async { [weak self] in
            guard let __self = self else { return }
            __self.removeMarkers(markerIdsToRemove)
            __self.markers.append(contentsOf: markersToAdd)
        }
    }

    fileprivate func removeMarkers(_ markerIds:[String]) {
        for item in markerIds {
            removeMarker(item)
        }
    }
    fileprivate func removeMarker(_ markerId:String) {
        let markerIndex = markers.index { (item) -> Bool in
            return item._id == markerId
        }
        guard let index = markerIndex else { return }
        markers.remove(at: index)
    }

}
