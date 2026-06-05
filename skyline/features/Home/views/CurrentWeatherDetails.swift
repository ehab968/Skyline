//
//  CurrentWeatherDetails.swift
//  skyline
//
//  Created by Ehab Salah on 02/06/2026.
//

import SwiftUI

struct CurrentWeatherDetails: View {
    let weatherResponse: WeatherResponse
    let currentForecast: ForecastDay
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text(weatherResponse.location.region)
                .font(.system(size: 36, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .padding(.top, 16)
            
            Text("\(Int(weatherResponse.current.tempC))°")
                .font(
                    .system(
                        size: 86,
                        weight: .ultraLight,
                        design: .rounded
                    )
                )
                .foregroundColor(.white)
                .padding(.vertical, -10)            
            Text(weatherResponse.current.condition.text)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
                .padding(.bottom, 8)
        
            HighLowTempratureAndImage(
                high: Int(currentForecast.day.maxtempC),
                low: Int(currentForecast.day.mintempC),
                imageName: currentForecast.day.condition.fullIconURL
            )
        }
    }
}

#Preview {
//    ZStack {
//        Color.blue.ignoresSafeArea()
//        CurrentWeatherDetails(
//            weather: CurrentWeather(
//                cityName: "Cairo",
//                temperature: 21,
//                condition: "Sunny",
//                highTemp: 25,
//                lowTemp: 18,
//                windSpeed: "12 km/h",
//                humidity: "64%",
//                uvIndex: "Low"
//            )
//        )
//    }
}
