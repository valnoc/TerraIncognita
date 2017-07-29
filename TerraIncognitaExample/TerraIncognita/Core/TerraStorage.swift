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
    
    fileprivate var readQueue:DispatchQueue
    fileprivate var writeQueue:DispatchQueue
    
    init() {
        markers = []
        
        readQueue = DispatchQueue(label: "TerraStorage_readQueue")
        writeQueue = DispatchQueue(label: "TerraStorage_writeQueue", qos: .userInitiated)
    }
    
    //MARK: add markers
    func addMarker(_ marker:TerraMarker) {
        writeQueue.async { [weak self] in
            guard let __self = self else { return }
            __self.markers.append(marker)
        }
    }
    func addMarkers(_ markers:[TerraMarker]) {
        writeQueue.async { [weak self] in
            guard let __self = self else { return }
            __self.markers.append(contentsOf: markers)
        }
    }
    
    //MARK: remove markers
    func removeMarker(_ markerId:String) {
        writeQueue.async { [weak self] in
            guard let __self = self else { return }
            __self.removeMarkerNow(markerId)
        }
    }
    fileprivate func removeMarkerNow(_ markerId:String) {
        let markerIndex = markers.index { (item) -> Bool in
            return item._id == markerId
        }
        guard let index = markerIndex else { return }
        markers.remove(at: index)
    }
    
    func removeMarkers(_ markerIds:[String]) {
        writeQueue.async { [weak self] in
            guard let __self = self else { return }
            for item in markerIds {
                __self.removeMarker(item)
            }
        }
    }
    func removeAllMarkers() {
        writeQueue.async { [weak self] in
            guard let __self = self else { return }
            __self.markers.removeAll()
        }
    }
}
