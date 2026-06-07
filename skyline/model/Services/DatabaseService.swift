//
//  DatabaseService.swift
//  skyline
//
//  Created by Ehab Salah on 06/06/2026.
//

import Foundation
import SwiftData
protocol DatabaseServiceProtocol {
    func saveCity(city: CityEntity) throws
    func fetchCities() throws -> [CityEntity]
    func deleteCity(city: CityEntity) throws
}

class DatabaseService: DatabaseServiceProtocol {
    private let modelContainer: ModelContainer
    private let context: ModelContext
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
        self.context = modelContainer.mainContext
    }
    
    func saveCity(city: CityEntity) throws{
        context.insert(city)
        try context.save()
    }

    func fetchCities() throws -> [CityEntity]  {
        var descriptor = FetchDescriptor<CityEntity>()
        descriptor.includePendingChanges = false
        let cities = try context.fetch(descriptor)
        return cities
    }

    func deleteCity(city: CityEntity) throws {
        context.delete(city)
        try context.save()
    }
    
}
