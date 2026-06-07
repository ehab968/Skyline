import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModelProtocol
    @State private var showAddCity = false
    @State private var selectedCity: String? = nil
    let addCityFactory: AddCityViewFactory
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
                addCityFactory.makeAddCityView(homeViewModel: viewModel, selectedCity: $selectedCity)
            }
            .AppBackground(for: viewModel.timeOfDay)
            .showCustomAlert(title: "Error", errorMessage: $viewModel.errorMessage)
            .toolbar(.hidden, for: .navigationBar)
            .onChange(of: selectedCity) { _, newValue in
                if let newValue {
                    Task {
                        if newValue == "Current Location" {
                            await viewModel.loadWeatherForCurrentLocation()
                        } else {
                            await viewModel.fetchCurrentWeatherAndForcast(city: newValue)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.refreshTimeOfDay()
            }
            .task {
                if selectedCity == nil {
                    await viewModel.loadWeatherForCurrentLocation()
                }
            }
        }
    }
}

#Preview {
    //    HomeView()
}
