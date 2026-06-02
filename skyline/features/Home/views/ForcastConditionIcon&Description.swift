//
//  ForcastConditionIcon&Description.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct ForcastConditionIconAndDescription: View {
    var day: ForecastDay
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: day.iconName)
                .font(.system(size: 20))
                .symbolRenderingMode(.multicolor)
                .frame(width: 28)
            
            Text(day.condition)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}

#Preview {
    ForcastConditionIconAndDescription( day: ForecastDay(
        day: "Monday",
        iconName: "sun.max.fill",
        condition: "Sunny",
        highTemp: 25,
        lowTemp: 18
    ))
}
