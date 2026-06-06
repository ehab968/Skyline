//
//  AddedCitiesSection.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct AddedCitiesSection: View {
    var viewModel: AddCityViewModelProtocol
    @Binding var selectedCity: String?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Section("Added Cities") {
            if viewModel.addedCities.isEmpty {
                Text("No cities added yet.")
                    .foregroundColor(.white.opacity(0.8))
            } else {
                ForEach(viewModel.addedCities, id: \.self) { city in
                    Button(action: {
                        selectedCity = city
                        dismiss()
                    }) {
                        HStack {
                            Text(city)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white.opacity(0.4))
                                .font(.footnote)
                        }
                    }
                }
            }
        }
        .listRowBackground(Color.glassCardBg)
    }
}

#Preview {
    //    AddedCitiesSection(viewModel: AddCityViewModel())
}
