//
//  CitiesHeaderView.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CitiesHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("My Cities")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text("Your saved locations")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.white.opacity(0.65))
            }
            Spacer()
            ZStack {
                Circle()
                    .fill(.white.opacity(0.15))
                    .frame(width: 46, height: 46)
                Image(systemName: "map.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(.white.opacity(0.9))
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
        .padding(.bottom, 16)
    }
}


#Preview {
    CitiesHeaderView()
}
