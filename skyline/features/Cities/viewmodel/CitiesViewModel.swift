//
//  CitiesViewModel.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import Foundation

// MARK: - Protocol

protocol CitiesViewModelProtocol {
    var addedCities: [String] { get }
    var currentLocationName: String? { get }
    var timeOfDay: TimeOfDay { get }
    func loadCities()
    func refreshTimeOfDay()
    func deleteCity(at offsets: IndexSet)
}

// MARK: - ViewModel

@Observable
class CitiesViewModel: CitiesViewModelProtocol {

    private let databaseService: DatabaseServiceProtocol
    private var cityEntities: [CityEntity] = []
    var addedCities: [String] = []
    let currentLocationName: String? = "My Location"
    private(set) var timeOfDay: TimeOfDay = .currentTimeOfDay()

    init(databaseService: DatabaseServiceProtocol) {
        self.databaseService = databaseService
        loadCities()
    }

    func refreshTimeOfDay() {
        timeOfDay = .currentTimeOfDay()
    }

    func loadCities() {
        do {
            let entities = try databaseService.fetchCities()
            cityEntities = entities
            var names = entities.map { $0.name }
            names.removeAll { $0 == currentLocationName }

            if let loc = currentLocationName {
                addedCities = [loc] + names
            } else {
                addedCities = names
            }
        } catch {
            print("CitiesViewModel — error fetching cities: \(error)")
        }
    }

    func deleteCity(at offsets: IndexSet) {
        guard let viewIndex = offsets.first else { return }
        // Protect index 0 when it's the current location placeholder
        if currentLocationName != nil && viewIndex == 0 { return }
        let dbIndex = currentLocationName != nil ? viewIndex - 1 : viewIndex
        guard dbIndex >= 0 && dbIndex < cityEntities.count else { return }

        let entityToDelete = cityEntities[dbIndex]
        do {
            try databaseService.deleteCity(city: entityToDelete)
            loadCities()
        } catch {
            print("CitiesViewModel — error deleting city: \(error)")
        }
    }
}
