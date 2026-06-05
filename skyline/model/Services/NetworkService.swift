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
    func fetchForecastWeather(lat: Double, long: Double) async throws -> ForecastResponse
    func searchCities(city: String) async throws -> [SearchResponse] 
}


class NetworkService: NetworkServiceProtocol {
    private let apiKey = "2b2f60d39bae4ab58b6111940260306"
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
            "days": "7",
            "aqi": "no",
            "alerts": "no"
        ]
        let task = AF.request(urlString, method: .get ,parameters: parameters)
            .serializingData()
        
        let response = try await JSONDecoder().decode(ForecastResponse.self,from: task.value)
        
        return response
    }
    
    
    func searchCities(city: String) async throws -> [SearchResponse] {
        guard let encodedQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return []
        }
        
        let urlString = "\(baseURL)/search.json"
        let parameters: [String: String] = [
            "key": apiKey,
            "q": encodedQuery
        ]
        let task = AF.request(urlString, method: .get ,parameters: parameters)
            .serializingData()
 
        let results = try await JSONDecoder().decode([SearchResponse].self,from: task.value)
        return results
    }
    
}
