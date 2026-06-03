//
//  CustomHomeNavigationBar.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct CustomHomeNavigationBar: View {
    @Binding var showAddCity: Bool
    var body: some View {
        HStack() {
            Button {
                showAddCity.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.glassCardBg)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 0)
    }
}

#Preview {
    CustomHomeNavigationBar(showAddCity: .constant(false))
}
