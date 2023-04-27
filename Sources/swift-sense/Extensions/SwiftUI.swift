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
#if os(iOS)
@available(iOS 15.0, *)
public extension View {
    
    /**
     # Adds corner radius
     - Parameter radius: CGFloat value
     - Parameter corners: UIRectCorner
     
     
     Usage
     
     ```swift
     View.Type
        .cornerRadius(20, corners: [.topLeft, .bottomRight])
     ```
     Source: https://stackoverflow.com/a/58606176/5177704
    */
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}



#endif
