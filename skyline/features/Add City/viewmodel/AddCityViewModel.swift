//
//  AddCityViewModel.swift
//  skyline
//
//  Created by Ehab Salah on 03/06/2026.
//

import Foundation

protocol AddCityViewModelProtocol {
    func addCity(city: SearchResponse)
    var searchText: String { get set }
    var addedCities: [String] { get }
    var suggestedCities: [SearchResponse] { get }
    var isLoading: Bool { get }
}

@Observable
class AddCityViewModel: AddCityViewModelProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    var addedCities: [String] = []
    var suggestedCities: [SearchResponse] = []
    var isLoading: Bool = false
    private var searchTask: Task<Void, Never>?
    
    
    
    var searchText: String = "" {
        didSet {
            searchTask?.cancel()
            searchTask = Task {
                try? await Task.sleep(nanoseconds: 300_000_000)
                await performSearch()
            }
        }
    }
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    @MainActor
    private func performSearch() async {
        guard searchText.count >= 1 else {
            self.suggestedCities = []
            return
        }
        
        isLoading = true
        do {
            self.suggestedCities = try await networkService.searchCities(city: searchText)
        } catch {
            print("Error searching cities: \(error)")
            self.suggestedCities = []
        }
        isLoading = false
    }
    
    func addCity(city: SearchResponse) {
        let cityName = city.name.cleanedWeatherName()
        if !addedCities.contains(cityName) {
            addedCities.insert(cityName, at: 0)
        }
        searchText = ""
    }
}
