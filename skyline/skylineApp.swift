//
//  skylineApp.swift
//  skyline
//
//  Created by Ehab Salah on 31/05/2026.
//

import SwiftUI

@main
struct skylineApp: App {
    let factory = HomeViewFactory(
        swinjectContainer: SwinjectContainer.shared,
        addCityFactory: SwinjectContainer.shared.resolve(AddCityViewFactory.self)
    )
    var body: some Scene {
        WindowGroup {
            factory.makeHomeView()
        }
    }
}
