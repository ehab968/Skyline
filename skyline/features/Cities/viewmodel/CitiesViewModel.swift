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
}

// MARK: - ViewModel

@Observable
class CitiesViewModel: CitiesViewModelProtocol {

    private let databaseService: DatabaseServiceProtocol
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
}
