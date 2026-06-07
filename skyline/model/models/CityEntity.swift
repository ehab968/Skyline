//
//  CityEntity.swift
//  skyline
//
//  Created by Ehab Salah on 06/06/2026.
//

import Foundation
import SwiftData

@Model
class CityEntity {
    @Attribute(.unique) var name: String
    var addedDate: Date
    
    init(name: String, addedDate: Date = Date()) {
        self.name = name
        self.addedDate = addedDate
    }
}
