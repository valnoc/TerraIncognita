//
//  TerraViewMarker.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 30/07/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

protocol TerraViewMarker {
    var terra_markerId: String! {get set}
    var terra_reuseIdentifier: String? {get set}
}
