//
//  ContentView.swift
//  skyline
//
//  Created by Ehab Salah on 31/05/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 28) {
                    if let currentWeather = viewModel.currentWeather {
                        CurrentWeatherDetails(weather: currentWeather)
                        
                        if !viewModel.forecast.isEmpty {
                            ForecastSection(forecast: viewModel.forecast)
                        }
                        WeatherStatsGrid(
                            windSpeed: currentWeather.windSpeed,
                            humidity: currentWeather.humidity,
                            uvIndex: currentWeather.uvIndex
                        )
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 24)
            }
            .timeBasedBackground(for: viewModel.timeOfDay)
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                viewModel.refreshTimeOfDay()
            }
        }
    }
}

#Preview {
    HomeView()
}
