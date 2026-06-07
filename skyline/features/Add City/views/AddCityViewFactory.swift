//
//  AddCityViewFactory.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import SwiftUI
import Swinject

class AddCityViewFactory {
    private let swinjectContainer: SwinjectContainer
    
    init(swinjectContainer: SwinjectContainer) {
        self.swinjectContainer = swinjectContainer
    }
    
    func makeAddCityView(homeViewModel: HomeViewModelProtocol) -> some View {
        let addCityVM = swinjectContainer.resolve(AddCityViewModelProtocol.self)
        return AddCityView(viewModel: addCityVM, homeViewModel: homeViewModel)
    }
}
