//
//  AMapsViewController.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class AMapsViewController: TerraViewController, AMapsManagerConfig {
    override func terraSource() -> TerraIncogintaSource {
        return .AMaps
    }
}
