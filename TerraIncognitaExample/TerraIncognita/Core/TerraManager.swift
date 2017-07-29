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
    func reloadMarkers(_ markers:[TerraMarker])
    
    //MARK: add markers
    func addMarker(_ marker:TerraMarker)
    func addMarkers(_ markers:[TerraMarker])
    
    //MARK: remove markers
    func removeMarker(_ markerId:String)
    func removeMarkers(_ markerIds:[String])
    func removeAllMarkers()
    
    //MARK - view
    var terraView: TerraView? {get}
    func makeTerraView() -> TerraView
}
