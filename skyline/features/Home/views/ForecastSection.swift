//
//  ForecastSection.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct ForecastSection: View {
    let forecast: [ForecastDay]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForcastSectionTitle()
            Divider()
                .background(Color.white)
                .padding(.horizontal, 16)
            
            VStack() {
                ForEach(forecast) { day in
                    HStack() {
                        // Day Label
                        ForcastDayLabel(day: day)
                        // Condition Icon & Description
                        ForcastConditionIconAndDescription(day: day)
                        
                        Spacer()
                        // High/Low Range
                        ForcastHighLowRange(day: day)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .padding(.bottom, 16)
        }
        .background(Color.glassCardBg)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        ForecastSection(forecast: [
            ForecastDay(day: "Today", iconName: "sun.max.fill", condition: "Sunny", highTemp: 25, lowTemp: 18),
            ForecastDay(day: "Tomorrow", iconName: "cloud.sun.fill", condition: "Partly Cloudy", highTemp: 24, lowTemp: 17),
            ForecastDay(day: "Thursday", iconName: "cloud.rain.fill", condition: "Showers", highTemp: 21, lowTemp: 15)
        ])
    }
}
