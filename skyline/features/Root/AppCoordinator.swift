//
//  AppCoordinator.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import Foundation

@Observable
class AppCoordinator {
    var selectedCity: String? = nil
    var activeTab: Int = 0

    func selectCity(_ city: String?) {
        selectedCity = city
        activeTab = 0
    }
}
