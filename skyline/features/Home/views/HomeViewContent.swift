//
//  HomeViewContent.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import SwiftUI

struct HomeViewContent: View {
    let viewModel: HomeViewModelProtocol
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 28) {
                if let weatherResponse = viewModel.weatherResponse,
                   let currentForecast = viewModel.forecastDays.first
                {
                    CurrentWeatherDetails( weatherResponse: weatherResponse, currentForecast: currentForecast)
                    ForecastSection(forecastDay: viewModel.forecastDays)
                    WeatherStatsGrid(
                        windSpeed: Int(weatherResponse.current.windKph.rounded()).description + " km/h",
                        humidity: weatherResponse.current.humidity.description,
                        uvIndex: Int(weatherResponse.current.uvIndex).description,
                        pressure: Int(weatherResponse.current.pressureMb.rounded()).description + " mb"
                    )
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 24)
        }
    }
}

#Preview {
//    HomeViewContent()
}
