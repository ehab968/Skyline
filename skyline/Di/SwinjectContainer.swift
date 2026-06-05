//
//  SwinjectContainer.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation
import Swinject
class SwinjectContainer {
    static let shared = SwinjectContainer()
    
    let container: Container
    
    private init() {
        self.container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        
        container.register(NetworkServiceProtocol.self) { _ in
            return NetworkService()
        }
        container.register(LocationServiceProtocol.self) { _ in
            return LocationService()
        }
        
        container.register(HomeViewModelProtocol.self) { r in
            let networkService = r.resolve(NetworkServiceProtocol.self)!
            let locationService = r.resolve(LocationServiceProtocol.self)!
            return HomeViewModel(networkService: networkService, locationService: locationService)
        }
    }
    
    
    func resolve<T>(_: T.Type) -> T {
        return container.resolve(T.self)!
    }
}

