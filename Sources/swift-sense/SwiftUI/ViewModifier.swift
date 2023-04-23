//
//  ViewModifier.swift
//  
//
//  Created by Kautilya Save on 4/23/23.
//

import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
struct CustomViewModifier: View {
    var body: some View {
        Text("Trials")
            .modifier(DefaultButtonViewModifier())
    }
}

@available(iOS 15.0, macOS 12.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}



@available(iOS 15.0, macOS 12.0, *)
struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    init(backgroundColor: Color = .blue) {
        self.backgroundColor = backgroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
    
}
