//
//  CitiesView.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CitiesView: View {
    @State var viewModel: CitiesViewModelProtocol
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            CitiesHeaderView()

            // MARK: - Content
            if viewModel.addedCities.isEmpty {
                CitiesEmptyStateView()
            } else {
                List {
                    ForEach(
                        Array(viewModel.addedCities.enumerated()),
                        id: \.element
                    ) { index, city in
                        Button {
                            let cityToLoad = (index == 0 && viewModel.currentLocationName != nil)
                                ? "Current Location"
                                : city
                            coordinator.selectCity(cityToLoad)
                        } label: {
                            CityRowCard(cityName: city, index: index)
                        }
                        .buttonStyle(.plain)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
                        .deleteDisabled(index == 0 && viewModel.currentLocationName != nil)
                    }
                    .onDelete { offsets in
                        viewModel.deleteCity(at: offsets)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
        .AppBackground(for: viewModel.timeOfDay)
        .onAppear {
            viewModel.refreshTimeOfDay()
            viewModel.loadCities()
        }
    }
}
