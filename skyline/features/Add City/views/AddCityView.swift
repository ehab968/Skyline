//
//  AddCityView.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct AddCityView: View {
    @State var viewModel: AddCityViewModelProtocol
    var homeViewModel: HomeViewModelProtocol
    @Binding var selectedCity: String?
    
    var body: some View {
        NavigationStack {
            List {
                // Mark: - Suggested Cities Section
                SuggestedCititesSction(viewModel: viewModel, selectedCity: $selectedCity)
                
                // Mark: - Added Cities Section
                AddedCitiesSection(viewModel: viewModel, selectedCity: $selectedCity)
            }
            .navigationTitle("Add City")
            .searchable(text: $viewModel.searchText, prompt: "Search for a city")
            .animation(.default, value: viewModel.searchText)
            .animation(.default, value: viewModel.addedCities)
            .scrollContentBackground(.hidden)
            .AppBackground(for: homeViewModel.timeOfDay)
        }
    }
}

#Preview {
    //    AddCityView(homeViewModel: HomeViewModel())
}
