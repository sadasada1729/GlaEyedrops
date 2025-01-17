//
//  MainView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/07.
//
// swiftlint:disable line_length
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

// swiftlint:enable line_length
