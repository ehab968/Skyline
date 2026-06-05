import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModelProtocol
    @State private var showAddCity = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Custom Navigation Bar
                CustomHomeNavigationBar(showAddCity: $showAddCity)
                Group {
                    // MARK: - Loading Indicator
                    if viewModel.isLoading {
                        Spacer()
                        HStack {
                            Spacer()
                            ProgressView()
                                .scaleEffect(1.5)
                                .tint(.white)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    
                    else {
                        HomeViewContent(viewModel: viewModel)
                    }
                    
                }
            }
            .navigationDestination(isPresented: $showAddCity) {
                AddCityView(homeViewModel: viewModel)
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
