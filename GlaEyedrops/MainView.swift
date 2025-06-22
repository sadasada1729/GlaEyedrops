import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    var body: some View {
        VStack {
            TopView(viewModel: viewModel)
            LinearGradient(gradient: Gradient(colors: [viewModel.color0, viewModel.color1, viewModel.color2]), startPoint: .top, endPoint: .bottom)
                .overlay(
                    VStack {
                        switch viewModel.viewContent {
                        case .drugName:
                            SearchDrugView()
                        case .component:
                            SearchComponentView()
                        }
                        Spacer()
                    }
            )
        }
        .ignoresSafeArea()
        .background(.white)
    }
}

#Preview {
    MainView()
}
