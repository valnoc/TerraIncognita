//
//  TerraView.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import MapKit

class GMapsView: MKMapView {

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

extension GMapsView: TerraView {
    func view() -> UIView {
        return self
    }
    
    func currentRegion() -> TerraRegion {
        let mkRegion = region
        let terraRegion = TerraRegion(center: mkRegion.center,
                                      deltaLat: mkRegion.span.latitudeDelta,
                                      deltaLon: mkRegion.span.longitudeDelta)
        return terraRegion
    }
    
    func updateViewMarkers(add viewMarkersToAdd: [TerraViewMarker], remove viewMarkersToRemove: [TerraViewMarker]) {
        DispatchQueue.main.async { [weak self] in
            guard let __self = self else { return }
            __self.delegate = __self
            __self.removeAnnotations(viewMarkersToRemove as! [GMapsViewMarker])
            __self.addAnnotations(viewMarkersToAdd as! [GMapsViewMarker])
        }
    }
}

extension GMapsView: MKMapViewDelegate {

}
