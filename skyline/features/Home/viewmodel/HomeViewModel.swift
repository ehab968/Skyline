//
//  HomeViewModel.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation
internal import _LocationEssentials

// MARK: - Protocol

protocol HomeViewModelProtocol {
    var forecastDays: [ForecastDay] { get }
    var timeOfDay: TimeOfDay { get }
    var weatherResponse: WeatherResponse? { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get set }
    
    func fetchCurrentWeatherAndForcast(lat: Double, long: Double) async
    func loadWeatherForCurrentLocation() async
    func refreshTimeOfDay()
}

// MARK: - ViewModel

@Observable
class HomeViewModel: HomeViewModelProtocol {
    private let networkService: NetworkServiceProtocol
    private let locationService: LocationServiceProtocol
    var forecastDays: [ForecastDay] = []
    private(set) var weatherResponse: WeatherResponse?
    private(set) var timeOfDay: TimeOfDay = .currentTimeOfDay()
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    init(networkService: NetworkServiceProtocol, locationService: LocationServiceProtocol) {
        self.networkService = networkService
        self.locationService = locationService
    }
    
    // Functions
    func loadWeatherForCurrentLocation() async {
        do {
            let coordinate = try await locationService.getCurrentLocation()
            print("Current Location: \(coordinate.latitude), \(coordinate.longitude)")
            await fetchCurrentWeatherAndForcast(lat: coordinate.latitude, long: coordinate.longitude)
        } catch {
            print("Error fetching location: \(error)")
        }
    }
    
    
    func fetchCurrentWeatherAndForcast(lat: Double, long: Double) async {
        isLoading = true
        errorMessage = nil
        do {
            async let currentTask = networkService.fetchCurrentWeather(lat: lat, long: long)
            async let forecastTask = networkService.fetchForecastWeather(lat: lat, long: long)
            
            let current = try await currentTask
            let forecast = try await forecastTask
            
            weatherResponse = current
            forecastDays = forecast.forecast.forecastday
        } catch {
            print("Error fetching weather: \(error)")
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func refreshTimeOfDay() {
        timeOfDay = .currentTimeOfDay()
    }
    
}
