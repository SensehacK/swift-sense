//
//  RoundedCorner.swift
//  
//
//  Created by Kautilya Save on 4/26/23.
//

import SwiftUI
#if os(iOS)
// Extension corner Radius
@available(iOS 13.0, *)
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
#endif
