//
//  TimeOfDay.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation

enum TimeOfDay {
    case morning
    case evening
    
    var backgroundImageName: String {
        switch self {
        case .morning: return "morning_bg"
        case .evening: return "evening_bg"
        }
    }
    static func currentTimeOfDay() -> TimeOfDay {
        let hour = Calendar.current.component(.hour, from: Date())
        return (hour >= 6 && hour < 18) ? .morning : .evening
    }
}
