//
//  TerraView.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import MapKit

class AMapsView: MKMapView {

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

extension AMapsView: TerraView {
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
        delegate = self
        removeAnnotations(viewMarkersToRemove as! [AMapsViewMarker])
        addAnnotations(viewMarkersToAdd as! [AMapsViewMarker])
    }
}

extension AMapsView: MKMapViewDelegate {

}
