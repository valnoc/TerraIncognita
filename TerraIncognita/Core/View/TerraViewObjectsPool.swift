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
        if let usedMarker = usedViewMarkers.filter({ $0.terra_markerId == markerId && $0.terra_reuseIdentifier == reuseIdentifier}).first {
            return usedMarker
        }
        else if var freeMarker = freeViewMarkers.first {
            freeMarker.terra_markerId = markerId
            freeMarker.terra_reuseIdentifier = reuseIdentifier
            return freeMarker
        }
        else {
            let newFreeMarker = makeViewMarker(markerId, reuseIdentifier: reuseIdentifier)
            usedViewMarkers.append(newFreeMarker)
            return newFreeMarker
        }
    }
    
    func enqueueReusableViewMarker(_ viewMarker:TerraViewMarker) {
        let markerId = viewMarker.terra_markerId
        guard let index = usedViewMarkers.index(where: {$0.terra_markerId == markerId}) else { return }
        usedViewMarkers.remove(at: index)
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
