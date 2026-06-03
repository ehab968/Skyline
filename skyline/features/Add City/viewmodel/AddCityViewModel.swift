//
//  AddCityViewModel.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import Foundation

protocol AddCityViewModelProtocol {
    var searchText: String { get set }
    var addedCities: [String] { get }
    var suggestedCities: [String] { get }
    func addCity(_ city: String)
}

@Observable
class AddCityViewModel: AddCityViewModelProtocol {
    var searchText: String = ""
    var addedCities: [String] = []
    
    private let allCities: [String] = [
        "New York", "London", "Paris", "Tokyo", "Dubai", "Singapore", 
        "Barcelona", "Los Angeles", "Rome", "Sydney", "Cairo", "Berlin",
        "Madrid", "Toronto", "Mumbai", "Seoul", "Amsterdam", "Riyadh",
        "Istanbul", "Vienna", "Bangkok", "Hong Kong", "Kuala Lumpur"
    ]
    
    var suggestedCities: [String] {
            if searchText.isEmpty {
                return allCities
            } else {
                return allCities.filter { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    func addCity(_ city: String) {
        if !addedCities.contains(city) {
            addedCities.insert(city, at: 0)
        }
        searchText = ""
    }
}
