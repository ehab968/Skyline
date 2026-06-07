//
//  CityRowCard.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CityRowCard: View {
    let cityName: String
    let index: Int
    
    private var isCurrentLocation: Bool { index == 0 }
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon badge
            CityRowCardIconBage(isCurrentLocation: isCurrentLocation)
            
            // Labels
            CityRowCardLabel(
                isCurrentLocation: isCurrentLocation,
                cityName: cityName
            )
            Spacer()
            
            // Trailing icon
            CityRowCardLastIcon(isCurrentLocation: isCurrentLocation)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(.glassCardBg)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(.white.opacity(0.15), lineWidth: 1)
                )
        )
    }
}
