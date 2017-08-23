//
//  TerraView.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import GoogleMaps

class GMapsView: GMSMapView {

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func removeOverlays(_ overlays:[GMSOverlay]) {
        for item in overlays {
            item.map = nil
        }
    }
    
    func addOverlays(_ overlays:[GMSOverlay]) {
        for item in overlays {
            item.map = self
        }
    }
}

extension GMapsView: TerraView {
    func view() -> UIView {
        return self
    }
    
    func currentRegion() -> TerraRegion {
        let gmsRegion = projection.visibleRegion()
        let terraRegion = TerraRegion(gmsVisibleRegion: gmsRegion)
        return terraRegion
    }
    
    func updateViewMarkers(add viewMarkersToAdd: [TerraViewMarker], remove viewMarkersToRemove: [TerraViewMarker]) {
        DispatchQueue.main.async { [weak self] in
            guard let __self = self else { return }
            __self.delegate = __self
            __self.removeOverlays(viewMarkersToRemove as! [GMapsViewMarker])
            __self.addOverlays(viewMarkersToAdd as! [GMapsViewMarker])
        }
    }
}

extension GMapsView: GMSMapViewDelegate {

}
