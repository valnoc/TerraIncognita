//
//  TerraViewController.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class TerraViewController: UIViewController, TerraManagerConfig {
    
    var terraManager: TerraManager!
    
    func configureWithTerraSource(_ source:TerraIncogintaSource) {
        terraManager = TerraIncognitaFactory().makeTerraManager(source: source, config: self)
        
        let terraView = terraManager.makeTerraView()
        let mapView = terraView.view()
        mapView.frame = self.view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
