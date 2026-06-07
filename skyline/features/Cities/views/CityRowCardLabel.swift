//
//  CityRowCardLabel.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CityRowCardLabel: View {
    let isCurrentLocation: Bool
    let cityName: String
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(cityName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
            
            Text(isCurrentLocation ? "Current Location" : "Saved City")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white.opacity(0.55))
        }
    }
}

#Preview {
//    CityRowCardLabel()
}
