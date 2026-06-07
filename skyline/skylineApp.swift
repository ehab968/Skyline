//
//  skylineApp.swift
//  skyline
//
//  Created by Ehab Salah on 31/05/2026.
//

import SwiftUI
import SwiftData
@main
struct skylineApp: App {
    let swinjectContainer = SwinjectContainer.shared
    let rootFactory: RootViewFactory
    let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                CityEntity.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    
    init() {
        swinjectContainer.setupModelContainer(sharedModelContainer)
        rootFactory = swinjectContainer.resolve(RootViewFactory.self)
    }
    
    var body: some Scene {
        WindowGroup {
            rootFactory.makeRootView()
        }
    }
}
