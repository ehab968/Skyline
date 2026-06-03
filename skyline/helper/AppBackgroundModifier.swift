//
//  TimeBasedBackgroundModifier.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation
import SwiftUI

struct AppBackgroundModifier: ViewModifier {
    let timeOfDay: TimeOfDay
    
    func body(content: Content) -> some View {
        ZStack {
            GeometryReader { geo in
                Image(timeOfDay.backgroundImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
            }
            .ignoresSafeArea()
            
            Color.black
                .opacity(timeOfDay == .morning ? 0.10 : 0.25)
                .ignoresSafeArea()
            
            content
        }
    }
}

extension View {
    func AppBackground(for timeOfDay: TimeOfDay) -> some View {
        self.modifier(AppBackgroundModifier(timeOfDay: timeOfDay))
    }
}
