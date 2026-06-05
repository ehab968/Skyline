//
//  CleanedWeatherName.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation

extension String {
    func cleanedWeatherName() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
                   .replacingOccurrences(of: "'", with: "")
    }
}
