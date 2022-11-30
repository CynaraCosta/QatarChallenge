//
//  RoundedCorner.swift
//  testinhoTV
//
//  Created by Cynara Costa on 30/11/22.
//

import SwiftUI

extension View {
    func cornerRadius(_ radious: CGFloat, corners: UIRectCorner) -> some
    View {
        clipShape(RoundedCorner(radious: radious, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radious: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radious, height: radious))
        return Path(path.cgPath)
    }
    
}
