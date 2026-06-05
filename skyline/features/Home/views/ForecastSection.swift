//
//  ForecastSection.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct ForecastSection: View {
    let forecastDay: [ForecastDay]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForcastSectionTitle()
            Divider()
                .background(Color.white)
                .padding(.horizontal, 16)
            
            VStack(spacing: 16) {
                ForEach(forecastDay) { day in
                    NavigationLink(destination: HourlyForecastView(viewModel: HourlyForecastViewModel(day: day))) {
                        HStack() {
                            // Day Label
                            ForcastDayLabel(day: day)
                            // Condition Icon & Description
                            ForcastConditionIconAndDescription(day: day)
                            
                            Spacer(minLength: 8)
                            
                            // High/Low Range
                            ForcastHighLowRange(day: day)
                        }
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(PlainButtonStyle())
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

}
