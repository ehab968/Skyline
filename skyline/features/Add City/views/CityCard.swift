//
//  CityCard.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CityCard: View {
    let cityName: String
    let index: Int
    var body: some View {
        HStack {
            Text(cityName)
                .foregroundColor(.white)
            Spacer()
            if index == 0 {
                Image(systemName: "location.fill")
                    .foregroundColor(.blue)
                    .font(.default)
            }
            else{
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.default)
            }
            
        }
    }
}

#Preview {
    //    CityCard()
}
