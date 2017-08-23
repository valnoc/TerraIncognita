//
//  TerraRegion+GMaps.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 20/08/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import GoogleMaps

extension TerraRegion {
    convenience init(gmsVisibleRegion: GMSVisibleRegion) {
        self.init(topLeft: gmsVisibleRegion.farLeft,
                  topRight: gmsVisibleRegion.farRight,
                  bottomLeft: gmsVisibleRegion.nearLeft,
                  bottomRight: gmsVisibleRegion.nearRight)
    }
}
