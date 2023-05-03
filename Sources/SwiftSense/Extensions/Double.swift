//
//  Double.swift
//  
//
//  Created by Kautilya Save on 4/26/23.
//

import Foundation


public extension Double {
    
    /**
     Rounds the value
     
     - Parameter Input: `2212.6`
     - Parameter Output: `2213`
     - Returns: String formatted value.
     - Warning: Strips the decimal value and rounds the Double value.
     
     */
    func roundValue() -> String {
        return String(format: "%.0f", self)
    }
}
