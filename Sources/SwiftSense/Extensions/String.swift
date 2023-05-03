//
//  String.swift
//  
//
//  Created by Kautilya Save on 4/27/23.
//

import Foundation


public extension StringProtocol {
    
    /**
     
     ```swift
     let inputStr = "Kautilya Save"
     // Extension method
     print(inputStr[0] inputStr[9]) // KS
     ```
     */
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
