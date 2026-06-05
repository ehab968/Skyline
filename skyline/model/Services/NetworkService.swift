//
//  NetworkService.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation
import Alamofire
protocol NetworkServiceProtocol {
    func fetchCurrentWeather(lat: Double, long: Double) async throws -> WeatherResponse
    func fetchCurrentWeather(city: String)
    func fetchForecastWeather(lat: Double, long: Double) async throws -> ForecastResponse
}


class NetworkService: NetworkServiceProtocol {
    private let apiKey = "1407565ffc634a1e9c4232549242907"
    private let baseURL = "https://api.weatherapi.com/v1"
    
    func fetchCurrentWeather(lat: Double, long: Double)async throws-> WeatherResponse {
        let urlString = "\(baseURL)/current.json"
        let parameters: [String: String] = [
            "key": apiKey,
            "q": "\(lat),\(long)",
            "aqi": "no"
        ]
        let task = AF.request(urlString, method: .get ,parameters: parameters)
            .serializingData()
        
        let response = try await JSONDecoder().decode(WeatherResponse.self,from: task.value)
        
        return response
    }
    
    func fetchForecastWeather(lat: Double, long: Double) async throws -> ForecastResponse {
        let urlString = "\(baseURL)/forecast.json"
        let parameters: [String: String] = [
            "key": apiKey,
            "q": "\(lat),\(long)",
            "days": "3",
            "aqi": "no",
            "alerts": "no"
        ]
        let task = AF.request(urlString, method: .get ,parameters: parameters)
            .serializingData()
        
        let response = try await JSONDecoder().decode(ForecastResponse.self,from: task.value)
        
        return response
    }
    
    func fetchCurrentWeather(city: String){
    }
    
}
