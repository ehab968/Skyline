//
//  ForcastSectionTitle.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct ForcastSectionTitle: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "calendar")
                .foregroundColor(.white.opacity(0.7))
            Text("7-DAY FORECAST")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
                .tracking(1)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

#Preview {
    ForcastSectionTitle()
}
