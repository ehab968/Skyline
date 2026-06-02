//
//  ForecastDay.swift
//  skyline
//

import Foundation

struct ForecastDay: Identifiable {
    let id = UUID()
    let day: String
    let iconName: String
    let condition: String
    let highTemp: Int
    let lowTemp: Int
}
