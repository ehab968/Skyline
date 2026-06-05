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
            Text("\(Int(day.day.mintempC))°")
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
            
            Text("\((Int(day.day.maxtempC)))°")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

#Preview {
}
