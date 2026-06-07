//
//  CitiesView.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct CitiesView: View {
    @State var viewModel: CitiesViewModelProtocol

    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            CitiesHeaderView()

            // MARK: - Content
            if viewModel.addedCities.isEmpty {
                CitiesEmptyStateView()
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 12) {
                        ForEach(
                            Array(viewModel.addedCities.enumerated()),
                            id: \.element
                        ) { index, city in
                            CityRowCard(cityName: city, index: index)
                                .transition(.opacity.combined(with: .move(edge: .bottom)))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 32)
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.addedCities)
                }
            }
        }
        .AppBackground(for: viewModel.timeOfDay)
        .onAppear {
            viewModel.refreshTimeOfDay()
            viewModel.loadCities()
        }
    }
}

