//
//  TerraViewController.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import UIKit
import CoreLocation

class TerraViewController: UIViewController, TerraManagerConfig {
    
    var terraManager: TerraManager!
    
    func configureWithTerraSource(_ source:TerraIncogintaSource) {
        terraManager = TerraIncognitaFactory().makeTerraManager(source: source, config: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let terraView = terraManager.makeTerraView()
        let mapView = terraView.view()
        mapView.frame = self.view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startUpdatingMarkers()
    }

    func startUpdatingMarkers() {
        terraManager.reloadMarkers(makeMarkersSet1())
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: { [weak self] in
            guard let __self = self else { return }
            __self.terraManager.reloadMarkers(__self.makeMarkersSet2())
        })
    }
    
    func makeMarkersSet1() -> [TerraMarker] {
        let factory = TerraIncognitaFactory()
        var markers:[TerraMarker] = []
        
        do{
            let marker = factory.makeTerraMarker(_id: "belgorod", coordinate: CLLocationCoordinate2D(latitude: 50.610, longitude: 36.590))
            markers.append(marker)
        }
        do{
            let marker = factory.makeTerraMarker(_id: "moscow", coordinate: CLLocationCoordinate2D(latitude: 55.750, longitude: 37.620))
            markers.append(marker)
        }
        
        return markers
    }
    
    func makeMarkersSet2() -> [TerraMarker] {
        let factory = TerraIncognitaFactory()
        var markers:[TerraMarker] = []
        
        do{
            let marker = factory.makeTerraMarker(_id: "st.peter", coordinate: CLLocationCoordinate2D(latitude: 59.930, longitude: 30.320))
            markers.append(marker)
        }
        do{
            let marker = factory.makeTerraMarker(_id: "Kazan", coordinate: CLLocationCoordinate2D(latitude: 55.750, longitude: 49.130))
            markers.append(marker)
        }
        
        return markers
    }
}
