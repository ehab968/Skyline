//
//  HourlyForecastView.swift
//  skyline
//

import SwiftUI
import Kingfisher

struct HourlyForecastView: View {
    @State var viewModel: HourlyForecastViewModel
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(viewModel.hours, id: \.timeEpoch) { hour in
                        HStack() {
                            Text(WeatherDateHelper.formatHourTime(hour.time))
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 75, alignment: .leading)
                            
                            KFImage(URL(string: hour.condition.fullIconURL))
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.multicolor)
                                .frame(width: 50, height: 50)
                            
                            Text(hour.condition.text)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(.white.opacity(0.9))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                            
                            Text("\(Int(hour.tempC))°")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 45, alignment: .leading)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .AppBackground(for: .currentTimeOfDay())
        .navigationTitle(WeatherDateHelper.formatWeatherDate(viewModel.day.date))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    // Preview omitted for brevity since ForecastDay mock is complex
}
