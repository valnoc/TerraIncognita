//
//  TerraManager.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 29/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

protocol TerraManagerDelegate:class {
}

protocol TerraManager {
    weak var delegate:TerraManagerDelegate? {get set}
    
    //MARK: - markers
    func reloadMarkers(_ newMarkers:[TerraMarker])
    func reloadMarkers(add markersToAdd:[TerraMarker], remove markerIdsToRemove:[String])
    
    //MARK - view
    var terraView: TerraView? {get}
    func makeTerraView() -> TerraView
}
