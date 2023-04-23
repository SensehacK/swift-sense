//
//  Image.swift
//  
//
//  Created by Kautilya Save on 4/23/23.
//

import SwiftUI

@available(iOS 13.0, macOS 12.0, *)
public extension Image {
    
    /**
     Initializes Image with type `Data` and returns back the Image.
    
     - Parameter data: Data - byte buffer type
     - Warning: If image couldn't be initialized then it resorts to SF Symbol `exclamationmark`.
    */
    init(data: Data) {
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            self.init(systemName: "exclamationmark.triangle")
        }
    }
    
}
