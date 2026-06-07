//
//  CitiesViewFactory.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI
import Swinject

class CitiesViewFactory {
    private let swinjectContainer: SwinjectContainer

    init(swinjectContainer: SwinjectContainer) {
        self.swinjectContainer = swinjectContainer
    }

    func makeCitiesView() -> some View {
        let citiesVM = swinjectContainer.resolve(CitiesViewModelProtocol.self)
        return CitiesView(viewModel: citiesVM)
    }
}
