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
                        HStack {
                            Text(WeatherDateHelper.formatHourTime(hour.time))
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 80, alignment: .leading)
                            
                            Spacer()
                            
                            KFImage(URL(string: hour.condition.fullIconURL))
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.multicolor)
                                .frame(width: 70, height: 70)
                            
                            Spacer()
                            
                            Text("\(Int(hour.tempC))°")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 50, alignment: .trailing)
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
