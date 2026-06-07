//
//  CitiesEmptyStateView.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CitiesEmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ZStack {
                Circle()
                    .fill(.white.opacity(0.1))
                    .frame(width: 100, height: 100)
                Image(systemName: "map")
                    .font(.system(size: 44))
                    .foregroundStyle(.white.opacity(0.45))
            }
            VStack(spacing: 8) {
                Text("No Cities Yet")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                Text("Tap + on the Weather tab to add\nyour first city.")
                    .font(.system(size: 14))
                    .foregroundStyle(.white.opacity(0.6))
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    CitiesEmptyStateView()
}
