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
        
        container.register(HomeViewModelProtocol.self) { r in
            let networkService = r.resolve(NetworkServiceProtocol.self)!
            return HomeViewModel(networkService: networkService)
        }
    }
    
    
    func resolve<T>(_: T.Type) -> T {
        return container.resolve(T.self)!
    }
}

