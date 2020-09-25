//
//  NewmorficShadow.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import SwiftUI

struct NeumorphicShadow: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.graish.opacity(0.1), radius: 5, x: -5, y: -5)
            .shadow(color: Color.darkShadow.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

extension View {
    
    func newmorphicShadow() -> some View {
        return self.modifier(NeumorphicShadow())
    }
}
