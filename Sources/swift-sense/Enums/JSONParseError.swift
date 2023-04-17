//
//  JSONParseError.swift
//  
//
//  Created by Kautilya Save on 4/17/23.
//

import Foundation

enum JSONParseError: Error {
    case fileNotFound
    case dataInitialisation(error: Error)
    case decoding(error: Error)
}
