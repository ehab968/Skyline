//
//  SuggestedCityRow.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct SuggestedCityRow: View {
    let city: SearchResponse
    
    var body: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                Circle()
                    .fill(.white.opacity(0.12))
                    .frame(width: 36, height: 36)
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(.white.opacity(0.85))
            }
            
            // City and Region
            VStack(alignment: .leading, spacing: 2) {
                Text(city.name)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                Text("\(city.region), \(city.country)")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.white.opacity(0.6))
                    .lineLimit(1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white.opacity(0.4))
        }
        .padding(.vertical, 8)
    }
}

#Preview {
//    SuggestedCityRow()
}
