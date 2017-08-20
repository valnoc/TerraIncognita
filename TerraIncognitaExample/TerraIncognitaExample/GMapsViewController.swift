//
//  GMapsViewController.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 20/08/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class GMapsViewController: TerraViewController, GMapsManagerConfig {
    override func terraSource() -> TerraIncogintaSource {
        return .GMaps
    }
}
