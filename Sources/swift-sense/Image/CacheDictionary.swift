//
//  CacheDictionary.swift
//  
//
//  Created by Kautilya Save on 4/19/23.
//

import SwiftUI

/// Storing our cache in dictionary with Key Value pairs.
@available(iOS 13.0, macOS 12.0, *)
class CacheDictionary {
    static private var cache: [String: Image] = [:]

    static subscript(key: String) -> Image? {
        get {
            CacheDictionary.cache[key]
        }
        set {
            CacheDictionary.cache[key] = newValue
        }
    }
}
