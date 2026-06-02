//
//  HomeViewModel.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation
protocol HomeViewModelProtocol {
    var currentWeather: CurrentWeather? { get }
    var forecast: [ForecastDay] { get }
}


@Observable
class HomeViewModel:HomeViewModelProtocol {
    var currentWeather: CurrentWeather?
    var forecast: [ForecastDay] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        self.currentWeather = CurrentWeather(
            cityName: "Cairo",
            temperature: 21,
            condition: "Sunny",
            highTemp: 25,
            lowTemp: 18,
            windSpeed: "12 km/h",
            humidity: "64%",
            uvIndex: "Low"
        )
        
        self.forecast = [
            ForecastDay(
                day: "Today",
                iconName: "sun.max.fill",
                condition: "Sunny",
                highTemp: 25,
                lowTemp: 18
            ),
            ForecastDay(
                day: "Tomorrow",
                iconName: "cloud.sun.fill",
                condition: "Partly Cloudy",
                highTemp: 24,
                lowTemp: 17
            ),
            ForecastDay(
                day: "Thursday",
                iconName: "cloud.rain.fill",
                condition: "Showers",
                highTemp: 21,
                lowTemp: 15
            )
        ]
    }
}
