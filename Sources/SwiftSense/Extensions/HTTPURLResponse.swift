//
//  HTTPURLResponse.swift
//  
//
//  Created by Kautilya Save on 4/14/23.
//

import Foundation

public extension HTTPURLResponse {
    
    /// Check for HTTP status code = 200 - successful
     func isResponseOK() -> Bool {
         return (200...299).contains(self.statusCode)
     }
}
