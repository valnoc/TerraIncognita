//
//  TerraView.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

protocol TerraView {
    func view() -> UIView
    
    func currentRegion() -> TerraRegion
    
    func updateViewMarkers(add viewMarkersToAdd:[TerraViewMarker], remove viewMarkersToRemove:[TerraViewMarker])
}
