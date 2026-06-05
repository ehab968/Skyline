import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModelProtocol
    @State private var showAddCity = false
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
                addCityFactory.makeAddCityView(homeViewModel: viewModel)
            }
            .AppBackground(for: viewModel.timeOfDay)
            .showErrorAlert(title: "Error", errorMessage: $viewModel.errorMessage)
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                viewModel.refreshTimeOfDay()
            }
            .task {
                await viewModel.loadWeatherForCurrentLocation()
            }
        }
    }
}

#Preview {
    //    HomeView()
}
