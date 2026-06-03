import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var showAddCity = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Custom Navigation Bar
                CustomHomeNavigationBar(showAddCity: $showAddCity)
                
                // MARK: - Content
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        if let currentWeather = viewModel.currentWeather {
                            CurrentWeatherDetails(weather: currentWeather)

                            if !viewModel.forecast.isEmpty {
                                ForecastSection(forecast: viewModel.forecast)
                            }
                            WeatherStatsGrid(
                                windSpeed: currentWeather.windSpeed,
                                humidity: currentWeather.humidity,
                                uvIndex: currentWeather.uvIndex
                            )
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 24)
                }
            }
            .navigationDestination(isPresented: $showAddCity) {
//                AddCityView(viewModel: viewModel)
            }
            .timeBasedBackground(for: viewModel.timeOfDay)
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                viewModel.refreshTimeOfDay()
            }
        }
    }
}

#Preview {
    HomeView()
}
