//
//  SearchResponse.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation

struct SearchResponse: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    
    var displayName: String {
        return "\(name), \(country)"
    }
}
