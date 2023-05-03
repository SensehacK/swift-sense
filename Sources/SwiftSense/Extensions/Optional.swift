//
//  Optional.swift
//  
//
//  Created by Kautilya Save on 4/25/23.
//

import Foundation

public extension Optional where Wrapped == String {

    /**
     Read Optional value conforming for type String and if empty returns ""
     - Returns: String
     - Warning: If optional value is nil then returns `""`.
     
    ```swift
     var someString: String?
     label.text = someString.orEmpty
    ```
    */
    var orEmpty: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return ""
        }
    }

}
