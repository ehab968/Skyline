//
//  CurrentWeather.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable{
    let location: Location
    let current: CurrentWeather
}

// MARK: - Location
struct Location: Codable{
    let name: String
    let region: String
    let country: String
    let latitude: Double
    let longitude: Double
    let timezoneId: String
    let localtimeEpoch: Int
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case name, region, country
        case latitude = "lat"
        case longitude = "lon"
        case timezoneId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable{
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: WeatherCondition
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDirection: String
    let pressureMb: Double
    let pressureIn: Double
    let precipitationMm: Double
    let precipitationIn: Double
    let humidity: Int
    let cloud: Int
    let feelsLikeC: Double
    let feelsLikeF: Double
    let windChillC: Double
    let windChillF: Double
    let heatIndexC: Double
    let heatIndexF: Double
    let dewPointC: Double
    let dewPointF: Double
    let visibilityKm: Double
    let visibilityMiles: Double
    let uvIndex: Double
    let gustMph: Double
    let gustKph: Double
    let willItRain: Int
    let chanceOfRain: Int
    let willItSnow: Int
    let chanceOfSnow: Int
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDirection = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipitationMm = "precip_mm"
        case precipitationIn = "precip_in"
        case humidity, cloud
        case feelsLikeC = "feelslike_c"
        case feelsLikeF = "feelslike_f"
        case windChillC = "windchill_c"
        case windChillF = "windchill_f"
        case heatIndexC = "heatindex_c"
        case heatIndexF = "heatindex_f"
        case dewPointC = "dewpoint_c"
        case dewPointF = "dewpoint_f"
        case visibilityKm = "vis_km"
        case visibilityMiles = "vis_miles"
        case uvIndex = "uv"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
    }
}

// MARK: - WeatherCondition
struct WeatherCondition: Codable {
    let text: String
    let icon: String
    let code: Int
    
    var fullIconURL: String {
        let urlString = icon.hasPrefix("//") ? "https:\(icon)" : icon
        return urlString
    }
}
