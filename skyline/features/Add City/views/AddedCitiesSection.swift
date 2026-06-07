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
                ForEach(Array(viewModel.addedCities.enumerated()),id: \.element) { index, city in
                    Button(action: {
                        if index == 0 && viewModel.currentLocationName != nil {
                            selectedCity = "Current Location"
                        } else {
                            selectedCity = city
                        }
                        dismiss()
                    }) {
                        CityCard(cityName: city, index: index)
                    }
                    .deleteDisabled(index == 0 && viewModel.currentLocationName != nil)
                }
                .onDelete(perform: viewModel.deleteCity)
            }
        }
        .listRowBackground(Color.glassCardBg)
    }
}

#Preview {
    //    AddedCitiesSection(viewModel: AddCityViewModel())
}
