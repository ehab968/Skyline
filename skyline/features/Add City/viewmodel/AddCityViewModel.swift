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
    var suggestedCities: [SearchResponse] { get }
    var currentLocationName: String? { get }
    var errorMessage: String? { get set }
    var isLoading: Bool { get }
    
    func addCity(city: SearchResponse)
    func deleteCity(at offsets: IndexSet)
    func loadDatabaseCities()
}

@Observable
class AddCityViewModel: AddCityViewModelProtocol {
    
    private let networkService: NetworkServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    private var cityEntities: [CityEntity] = []
    var addedCities: [String] = []
    var suggestedCities: [SearchResponse] = []
    var currentLocationName: String? = "My Location"
    var isLoading: Bool = false
    var errorMessage: String? = nil
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
    
    init(networkService: NetworkServiceProtocol, databaseService: DatabaseServiceProtocol) {
        self.networkService = networkService
        self.databaseService = databaseService
        loadDatabaseCities()
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
}


// Mark: - Database Functions Section

extension AddCityViewModel {
    
    func addCity(city: SearchResponse) {
        let cityName = city.name.cleanedWeatherName()
        
        guard cityName != currentLocationName, !addedCities.contains(cityName) else {
            searchText = ""
            errorMessage = "City already added or is your current location."
            return
        }
        let newCityEntity = CityEntity(name: cityName)
        
        do {
            try databaseService.saveCity(city: newCityEntity)
            loadDatabaseCities()
        } catch {
            print("Error saving city to DB: \(error)")
            errorMessage = "Error saving city to DB: \(error)"
        }
        searchText = ""
    }
    
    func loadDatabaseCities() {
        do {
            let entities = try databaseService.fetchCities()
            cityEntities = entities
            var dbCityNames = entities.map { $0.name }
            dbCityNames.removeAll(where: { $0 == currentLocationName })
            
            if let currentLocation = currentLocationName {
                self.addedCities = [currentLocation] + dbCityNames
            } else {
                self.addedCities = dbCityNames
            }
            
        } catch {
            print("Error fetching cities from DB: \(error)")
            errorMessage = "Error fetching cities from DB: \(error)"
        }
    }
    
    func deleteCity(at offsets: IndexSet) {
        guard let viewIndex = offsets.first else { return }
        if currentLocationName != nil && viewIndex == 0 { return }
        let dbIndex = currentLocationName != nil ? viewIndex - 1 : viewIndex
        guard dbIndex >= 0 && dbIndex < cityEntities.count else { return }
        
        let entityToDelete = cityEntities[dbIndex]
        
        do {
            try databaseService.deleteCity(city: entityToDelete)
            loadDatabaseCities()
        } catch {
            print("Error deleting city from DB: \(error)")
            errorMessage = "Error deleting city from DB: \(error)"
        }
    }
}


