//
//  AddedCitiesSection.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct AddedCitiesSection: View {
    var viewModel: AddCityViewModelProtocol
    @Environment(AppCoordinator.self) private var coordinator
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Section("Added Cities") {
            if viewModel.addedCities.isEmpty {
                Text("No cities added yet.")
                    .foregroundColor(.white.opacity(0.8))
            } else {
                ForEach(Array(viewModel.addedCities.enumerated()),id: \.element) { index, city in
                    Button(action: {
                        let cityToShow = (index == 0 && viewModel.currentLocationName != nil)
                        ? "Current Location" : city
                        
                        coordinator.selectCity(cityToShow)
                        dismiss()
                    }) {
                        AddCityCard(cityName: city, index: index)
                    }
                    .deleteDisabled(index == 0 && viewModel.currentLocationName != nil)
                    .listRowSeparatorTint(.white.opacity(0.5))
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
