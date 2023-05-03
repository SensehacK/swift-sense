//
//  Collection.swift
//  
//
//  Created by Kautilya Save on 4/17/23.
//

import Foundation

// Syntactic Sugar
public extension Collection {
    /// Returns inverted Bool value for `isEmpty`
    var isNotEmpty: Bool { !isEmpty }
}

/// Check for index range in collection first before directly accessing the value at the given `index`.
public extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
     return (startIndex <= index && index < endIndex) ? self[index] : nil
   }
}
