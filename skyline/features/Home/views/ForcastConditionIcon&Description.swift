//
//  ForcastConditionIcon&Description.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI
import Kingfisher
struct ForcastConditionIconAndDescription: View {
    var day: ForecastDay
    var body: some View {
        HStack(spacing: 8) {
            KFImage(URL(string: day.day.condition.fullIconURL))
                .resizable()
                .symbolRenderingMode(.multicolor)
                .frame(width: 35, height: 35)
            
            
            Text(day.day.condition.text)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(1)
        }
    }
}

#Preview {
//    ForcastConditionIconAndDescription( day: ForecastDay(
//        day: "Monday",
//        iconName: "sun.max.fill",
//        condition: "Sunny",
//        highTemp: 25,
//        lowTemp: 18
//    ))
}
