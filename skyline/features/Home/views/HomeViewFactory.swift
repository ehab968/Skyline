//
//  HomeViewFactory.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation
import SwiftUI

class HomeViewFactory {
    private let swinjectContainer: SwinjectContainer
    private let addCityFactory: AddCityViewFactory
    init(swinjectContainer: SwinjectContainer, addCityFactory: AddCityViewFactory) {
        self.swinjectContainer = swinjectContainer
        self.addCityFactory = addCityFactory
    }
    
    func makeHomeView() -> some View {
        let homeVM = swinjectContainer.resolve(HomeViewModelProtocol.self)
        return HomeView(viewModel: homeVM, addCityFactory: addCityFactory)
    }
}
