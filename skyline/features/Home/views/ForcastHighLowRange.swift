//
//  ForcastHighLowRange.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct ForcastHighLowRange: View {
    var day: ForecastDay
    var body: some View {
        HStack(spacing: 12) {
            Text("\(day.lowTemp)°")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.6))
            
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [Color.cyan, Color.accentOrange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 40, height: 5)
            
            Text("\(day.highTemp)°")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
        }
//        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ForcastHighLowRange(
        day: ForecastDay(
            day: "Monday",
            iconName: "sun.max.fill",
            condition: "Sunny",
            highTemp: 25,
            lowTemp: 18
        )
    )
}
