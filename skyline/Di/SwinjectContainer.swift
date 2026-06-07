//
//  SwinjectContainer.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation
import Swinject
import SwiftData
class SwinjectContainer {
    static let shared = SwinjectContainer()
    
    let container: Container
    
    private init() {
        self.container = Container()
        registerDependencies()
    }
    
    func setupModelContainer(_ modelContainer: ModelContainer) {
        container.register(ModelContainer.self) { _ in
            return modelContainer
        }.inObjectScope(.container)
    }
    
    private func registerDependencies() {
        
        // NetworkService, LocationService and DatabaseService
        container.register(NetworkServiceProtocol.self) { _ in
            return NetworkService()
        }
        container.register(LocationServiceProtocol.self) { _ in
            return LocationService()
        }
        container.register(DatabaseServiceProtocol.self){ r in
            let modelContainer = r.resolve(ModelContainer.self)!
            return DatabaseService(modelContainer: modelContainer)
        }
        
        // ViewModels
        container.register(HomeViewModelProtocol.self) { r in
            let networkService = r.resolve(NetworkServiceProtocol.self)!
            let locationService = r.resolve(LocationServiceProtocol.self)!
            return HomeViewModel(networkService: networkService, locationService: locationService)
        }
        
        container.register(AddCityViewModelProtocol.self) { r in
            let networkService = r.resolve(NetworkServiceProtocol.self)!
            let databaseService = r.resolve(DatabaseServiceProtocol.self)!
            return AddCityViewModel(networkService: networkService, databaseService: databaseService)
        }
        
        // Factories
        container.register(AddCityViewFactory.self) { _ in
            return AddCityViewFactory(swinjectContainer: self)
        }
        
        container.register(HomeViewFactory.self) { r in
            let addCityFact = r.resolve(AddCityViewFactory.self)!
            return HomeViewFactory(swinjectContainer: self, addCityFactory: addCityFact)
        }
    }
    
    func resolve<T>(_: T.Type) -> T {
        return container.resolve(T.self)!
    }
}

