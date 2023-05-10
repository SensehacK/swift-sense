//
//  UIView.swift
//  
//
//  Created by Kautilya Save on 4/30/23.
//

#if os(iOS)
import UIKit

public extension UIView {
    
    /// Pins the current view to the parent view frame constraints
    /// - Parameter view: Type UIView
    func pinToParent(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
}
#endif
