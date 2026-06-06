//
//  SuggestedCititesSction.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct SuggestedCititesSction: View {
    var viewModel: AddCityViewModelProtocol
    @Binding var selectedCity: String?
    @Environment(\.isSearching) private var isSearching
    @Environment(\.dismissSearch) private var dismissSearch
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        if isSearching {
            Section("Suggested Cities") {
                
                if viewModel.isLoading {
                    ShowLoadingIndicator()
                }
                if viewModel.suggestedCities.isEmpty {
                    Text("No cities found")
                        .foregroundColor(.white.opacity(0.8))
                } else {
                    ForEach(viewModel.suggestedCities, id: \.self) { city in
                        Button(action: {
                            viewModel.addCity(city: city)
                            selectedCity = city.name
                            dismissSearch()
                            dismiss()
                        }) {
                            Text(city.displayName)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .listRowBackground(Color.glassCardBg)
        }
    }
}

//#Preview {
//    SuggestedCititesSction(viewModel: AddCityViewModel())
//}
