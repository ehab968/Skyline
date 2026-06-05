//
//  HomeViewFactory.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation

class HomeViewFactory {
    private let swinjectContainer: SwinjectContainer
    init(swinjectContainer: SwinjectContainer) {
        self.swinjectContainer = swinjectContainer
    }
    func makeHomeView() -> HomeView {
        let viewModel = swinjectContainer.resolve(HomeViewModelProtocol.self)
        return HomeView(viewModel: viewModel)
    }
}
