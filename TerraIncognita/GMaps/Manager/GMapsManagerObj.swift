//
//  GMapsManagerBase.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import GoogleMaps

class GMapsManagerObj: TerraManagerBase {

    weak var gMapsDelegate: GMapsManagerDelegate? {
        get{
            return delegate as? GMapsManagerDelegate
        }
        set{
            delegate = newValue
        }
    }

    init(config: GMapsManagerConfig) {
        super.init(config: config)
        
        GMSServices.provideAPIKey(config.apiKey)
        viewObjectsPool = GMapsViewObjectsPool()
    }

    //MARK: - markers

    //MARK: - view
    override func makeTerraView() -> TerraView {
        view = GMapsView()
        return view!
    }

}
