//
//  SuggestedCititesSction.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import SwiftUI

struct SuggestedCititesSction: View {
    var viewModel: AddCityViewModel
    @Environment(\.isSearching) private var isSearching
    @Environment(\.dismissSearch) private var dismissSearch
    var body: some View {
        if isSearching {
            Section("Suggested Cities") {
                if viewModel.suggestedCities.isEmpty {
                    Text("No cities found")
                        .foregroundColor(.white.opacity(0.8))
                } else {
                    ForEach(viewModel.suggestedCities, id: \.self) { city in
                        Button(action: {
                            viewModel.addCity(city)
                            dismissSearch()
                        }) {
                            Text(city)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .listRowBackground(Color.glassCardBg)
        }
    }
}

#Preview {
    SuggestedCititesSction(viewModel: AddCityViewModel())
}
