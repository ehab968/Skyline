//
//  ForcastDayLabel.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct ForcastDayLabel: View {
    var day: ForecastDay
    
    var body: some View {
        Text(WeatherDateHelper.formatWeatherDate(day.date))
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
            .frame(width: 80, alignment: .leading)
    }
}

#Preview {
//    ForcastDayLabel()
}
