//
//  Trimmed.swift
//  
//
//  Created by Kautilya Save on 4/28/23.
//

import Foundation

/**
 Property wrapper for String trimming.
 
 This won't fail due to extra trailing `whitespace` in the source string. Use case could be when handling with passing strings to URL. This is just one more active way of making sure the strings being passed are sanitized with basic cleanup.
 You can always check for REGEX `:`, `\\`, `/` options present in every URL string to be more robust. But we would like to `KISS` with this property wrapper.
 
 - Return: It returns a string without extra whitespaces and new lines
 
 ```swift
 @Trimmed
 var websiteString = "https://sensehack.github.io "
 let website = URL(string: websiteString)!
 ```
 */
@propertyWrapper
public struct Trimmed {
    var value: String
    
    
    public init(wrappedValue: String) {
        self.value = wrappedValue
    }
    
    public var wrappedValue: String {
        get {
            value.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        set {
            value = newValue
        }
    }
    
}
