//
//  HighLowTemprature.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct HighLowTempratureAndImage: View {
    let high: Int
    let low: Int
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(Color.accentOrange)
                    Text("H: \(high)°")
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "arrow.down.circle.fill")
                        .foregroundColor(Color.cyan)
                    Text("L: \(low)°")
                }
            }
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(Color.glassCardBg)
            .cornerRadius(20)
            
            Image(.sunny)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .padding(.top, 4)
        }
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        HighLowTempratureAndImage(high: 25, low: 18)
    }
}
