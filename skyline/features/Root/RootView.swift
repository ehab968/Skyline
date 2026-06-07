//
//  RootView.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct RootView: View {
    let homeFactory: HomeViewFactory
    let citiesFactory: CitiesViewFactory

    @State private var coordinator = AppCoordinator()

    var body: some View {
        TabView(selection: $coordinator.activeTab) {
            // MARK: - Weather Tab
            homeFactory.makeHomeView()
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.fill")
                }
                .tag(0)

            // MARK: - Cities Tab
            citiesFactory.makeCitiesView()
                .tabItem {
                    Label("Cities", systemImage: "list.bullet")
                }
                .tag(1)
        }
        .environment(coordinator)
        .tint(.white)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
            appearance.backgroundColor = UIColor.black.withAlphaComponent(0.25)

            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.45)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white.withAlphaComponent(0.45)
            ]

            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
