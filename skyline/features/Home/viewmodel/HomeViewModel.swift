//
//  HomeViewModel.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation

// MARK: - Protocol

protocol HomeViewModelProtocol {
    var currentWeather: CurrentWeather? { get }
    var forecast: [ForecastDay] { get }
    var timeOfDay: TimeOfDay { get }
}

// MARK: - ViewModel

@Observable
class HomeViewModel: HomeViewModelProtocol {
    var currentWeather: CurrentWeather?
    var forecast: [ForecastDay] = []
    
    private(set) var timeOfDay: TimeOfDay = .currentTimeOfDay()
    
    init() {
        loadMockData()
    }
    
    func refreshTimeOfDay() {
        timeOfDay = .currentTimeOfDay()
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
