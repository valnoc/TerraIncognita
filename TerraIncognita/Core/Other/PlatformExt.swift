//
//  PlatformExt.swift
//  TerraIncognitaExample
//
//  Created by Valeriy Bezuglyy on 22/08/2017.
//  Copyright © 2017 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}
