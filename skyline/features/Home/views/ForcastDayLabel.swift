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
        Text(day.day)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(width: 85, alignment: .leading)
    }
}

#Preview {
//    ForcastDayLabel()
}
