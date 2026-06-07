import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModelProtocol
    @State private var showAddCity = false
    let addCityFactory: AddCityViewFactory
    
    @Environment(AppCoordinator.self) private var coordinator
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Custom Navigation Bar
                CustomHomeNavigationBar(showAddCity: $showAddCity)
                Group {
                    // MARK: - Loading Indicator
                    if viewModel.isLoading {
                        ShowLoadingIndicator()
                    }
                    
                    else {
                        HomeViewContent(viewModel: viewModel)
                    }
                    
                }
            }
            .navigationDestination(isPresented: $showAddCity) {
                addCityFactory.makeAddCityView(homeViewModel: viewModel)
            }
            .refreshable {
                await viewModel.refreshWeather()
            }
            .AppBackground(for: viewModel.timeOfDay)
            .showCustomAlert(title: "Error", errorMessage: $viewModel.errorMessage)
            .toolbar(.hidden, for: .navigationBar)
            
            .onChange(of: coordinator.selectedCity) { _, _ in
                if let city = coordinator.selectedCity {
                    Task {
                        if city == "Current Location" {
                            print("Loading weather for current location")
                            await viewModel.loadWeatherForCurrentLocation()
                        } else {
                            print("Loading weather for city: \(city)")
                            await viewModel.fetchCurrentWeatherAndForcast(city: city)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.refreshTimeOfDay()
            }
            .task {
                if coordinator.selectedCity == nil {
                    await viewModel.loadWeatherForCurrentLocation()
                }
            }
        }
    }
}

#Preview {
    //    HomeView()
}
