//
//  CityCard.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct AddCityCard: View {
    let cityName: String
    let index: Int

    var body: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                Circle()
                    .fill(.white.opacity(0.12))
                    .frame(width: 36, height: 36)
                Image(systemName: index == 0 ? "location.fill" : "building.2.fill")
                    .font(.system(size: 15))
                    .foregroundStyle(index == 0 ? Color.blue.opacity(0.9) : .white.opacity(0.8))
            }

            // City Name
            VStack(alignment: .leading, spacing: 2) {
                Text(cityName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                if index == 0 {
                    Text("Current Location")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.6))
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white.opacity(0.4))
        }
    }
}

#Preview {
//    CityCard()
}
