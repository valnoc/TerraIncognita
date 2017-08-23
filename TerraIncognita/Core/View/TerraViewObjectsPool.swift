//
//  TerraViewObjectsPool.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class TerraViewObjectsPool {
    
    let maxPoolCount = 5
    var freeViewMarkers: [TerraViewMarker]
    
    var usedViewMarkers: [TerraViewMarker]
    
    init() {
        usedViewMarkers = []
        freeViewMarkers = []
    }
    
    //MARK: dequeue / enqueue
    func dequeueReusableViewMarker(_ markerId: String, reuseIdentifier:String?) -> TerraViewMarker {
        var marker: TerraViewMarker? = nil
        
        if let reuseIdentifier = reuseIdentifier {
            if let usedMarker = usedViewMarkers.filter({ $0.terra_markerId == markerId && $0.terra_reuseIdentifier == reuseIdentifier}).first {
                marker = usedMarker
            }
            else if let freeMarker = freeViewMarkers.first {
                freeMarker.terra_markerId = markerId
                freeMarker.terra_reuseIdentifier = reuseIdentifier
                marker = freeMarker
            }
        }
        
        if marker == nil {
            marker = makeViewMarker(markerId, reuseIdentifier: reuseIdentifier)
        }
        
        usedViewMarkers.append(marker!)
        return marker!
    }
    
    func enqueueReusableViewMarker(_ viewMarker:TerraViewMarker) {
        let markerId = viewMarker.terra_markerId
        guard let index = usedViewMarkers.index(where: {$0.terra_markerId == markerId}) else { return }
        usedViewMarkers.remove(at: index)
        
        guard viewMarker.terra_reuseIdentifier != nil else { return }
        if freeViewMarkers.count < maxPoolCount {
            freeViewMarkers.append(viewMarker)
        }
    }

    func enqueueReusableViewMarkers(_ viewMarkers:[TerraViewMarker]) {
        for item in viewMarkers {
            enqueueReusableViewMarker(item)
        }
    }
    
    //MARK: viewMarkers
    func otherUsedViewMarkers(_ actualViewMarkers:[TerraViewMarker]) -> [TerraViewMarker] {
        let actualIds:[String] = actualViewMarkers.map({$0.terra_markerId})
        let otherViewMarkers = usedViewMarkers.filter({ actualIds.contains($0.terra_markerId) == false })
        return otherViewMarkers
    }
    
    func makeViewMarker(_ markerId: String, reuseIdentifier:String?) -> TerraViewMarker {
        fatalError(debugMessage_notImplemented)
    }
    
}
