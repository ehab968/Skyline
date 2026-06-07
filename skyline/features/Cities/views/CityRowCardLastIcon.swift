//
//  CityRowCardLastIcon.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CityRowCardLastIcon: View {
    let isCurrentLocation: Bool
    var body: some View {
        if isCurrentLocation {
            Circle()
                .fill(Color.green)
                .frame(width: 8, height: 8)
                .shadow(color: .green.opacity(0.7), radius: 4)
        } else {
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.white.opacity(0.35))
        }
    }
}

#Preview {
//    CityRowCardLastIcon()
}
