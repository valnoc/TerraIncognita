//
//  AMapsManagerBase.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class AMapsManagerObj: TerraManagerBase {

    weak var aMapsDelegate: AMapsManagerDelegate? {
        get{
            return delegate as? AMapsManagerDelegate
        }
        set{
            delegate = newValue
        }
    }

    init(config: AMapsManagerConfig) {
        super.init(config: config)
        viewObjectsPool = AMapsViewObjectsPool()
    }

    //MARK: - markers

    //MARK: - view
    override func makeTerraView() -> TerraView {
        view = AMapsView()
        return view!
    }

}
