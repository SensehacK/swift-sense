//
//  File.swift
//  
//
//  Created by Kautilya Save on 4/23/23.
//
import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
public extension View {
    
    /**
     Adds ViewModifier to any `View` with standard button layout.
    
     - Parameter backgroundColor: Color.blue is the default color
     */
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}
