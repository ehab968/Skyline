//
//  RootViewFactory.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI
import Swinject

class RootViewFactory {
    private let swinjectContainer: SwinjectContainer
    private let homeFactory: HomeViewFactory
    private let citiesFactory: CitiesViewFactory

    init(swinjectContainer: SwinjectContainer,
         homeFactory: HomeViewFactory,
         citiesFactory: CitiesViewFactory) {
        self.swinjectContainer = swinjectContainer
        self.homeFactory = homeFactory
        self.citiesFactory = citiesFactory
    }

    func makeRootView() -> some View {
        RootView(homeFactory: homeFactory, citiesFactory: citiesFactory)
    }
}
