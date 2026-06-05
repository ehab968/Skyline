//
//  WeatherStatsGrid.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct WeatherStatsGrid: View {
    let windSpeed: String
    let humidity: String
    let uvIndex: String
    let pressure: String
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            
            StatCard(
                title: "WIND",
                value: windSpeed,
                iconName: "wind",
                iconColor: .white.opacity(0.9)
            )
            
            StatCard(
                title: "HUMIDITY",
                value: humidity,
                iconName: "humidity.fill",
                iconColor: Color.cyan
            )
            
            StatCard(
                title: "UV INDEX",
                value: uvIndex,
                iconName: "sun.max.fill",
                iconColor: Color.accentOrange
            )
            StatCard(
                title: "Pressure",
                value: pressure,
                iconName: "gauge",
                iconColor: Color.purple
            )
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
//    ZStack {
//        Color.blue.ignoresSafeArea()
//        WeatherStatsGrid(windSpeed: "12 km/h", humidity: "64%", uvIndex: "Low")
//    }
}
