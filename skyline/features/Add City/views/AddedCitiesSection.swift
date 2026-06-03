//
//  AddedCitiesSection.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct AddedCitiesSection: View {
    var viewModel: AddCityViewModel
    
    var body: some View {
        Section("Added Cities") {
            if viewModel.addedCities.isEmpty {
                Text("No cities added yet.")
                    .foregroundColor(.white.opacity(0.8))
            } else {
                ForEach(viewModel.addedCities, id: \.self) { city in
                    Text(city)
                        .foregroundColor(.white)
                }
            }
        }
        .listRowBackground(Color.glassCardBg)
    }
}

#Preview {
    AddedCitiesSection(viewModel: AddCityViewModel())
}
