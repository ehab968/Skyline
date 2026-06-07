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
                } else if viewModel.suggestedCities.isEmpty {
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white.opacity(0.5))
                        Text("No cities found")
                            .foregroundStyle(.white.opacity(0.7))
                            .font(.subheadline)
                    }
                    .padding(.vertical, 8)
                } else {
                    ForEach(viewModel.suggestedCities, id: \.self) { city in
                        Button(action: {
                            viewModel.addCity(city: city)
                            selectedCity = city.name
                            dismissSearch()
                            dismiss()
                        }) {
                            SuggestedCityRow(city: city)
                        }
                        .buttonStyle(.plain)
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
