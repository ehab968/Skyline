//
//  StatCard.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct StatCard: View {
    var title: String
    var value: String
    var iconName: String
    var iconColor: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundColor(iconColor)
            
            Text(title)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(.white.opacity(0.6))
            
            Text(value)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.glassCardBg)
        .cornerRadius(16)
    }
}

#Preview {
    StatCard( title: "Wind Speed", value: "12 km/h", iconName: "wind", iconColor: .cyan)
     
}
