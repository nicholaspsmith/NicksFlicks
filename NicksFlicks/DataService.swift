//
//  DataService.swift
//  NicksFlicks
//
//  Created by Nick on 1/17/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _key: Int = 0
    
    var key: Int {
        get {
            return _key
        }
        set {
            _key = newValue
        }
    }
}