//
//  MainView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/07.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    var body: some View {
        VStack {
            TopView(viewModel: viewModel)
            LinearGradient(gradient: Gradient(colors: [viewModel.color0, viewModel.color1, viewModel.color2, viewModel.color3]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        switch viewModel.viewContent {
                        case .drug_name:
                            SearchDrugView()
                        case .component:
                            Text("osada")
                        }
                        Spacer()
                    }
                        .compositingGroup()
                        .shadow(radius: 5)
            )
        }
        
    }
}

#Preview {
    MainView()
}
