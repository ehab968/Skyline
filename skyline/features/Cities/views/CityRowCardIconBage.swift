//
//  CityRowCardIcon.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CityRowCardIconBage: View {
    var isCurrentLocation: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(isCurrentLocation
                      ? LinearGradient(colors: [.blue.opacity(0.7), .cyan.opacity(0.5)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                      : LinearGradient(colors: [.white.opacity(0.18), .white.opacity(0.08)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 44, height: 44)
            
            Image(systemName: isCurrentLocation ? "location.fill" : "building.2.fill")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    CityRowCardIconBage()
}
