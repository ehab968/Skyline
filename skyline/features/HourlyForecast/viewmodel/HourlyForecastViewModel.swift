//
//  HourlyForecastViewModel.swift
//  skyline
//

import Foundation

@Observable
class HourlyForecastViewModel {
    let day: ForecastDay
    let hours: [HourForecast]
    
    init(day: ForecastDay) {
        self.day = day
        self.hours = day.hour
    }
}
