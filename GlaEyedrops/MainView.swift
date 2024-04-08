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
            switch viewModel.viewContent {
            case .drug_name:
                SearchDrugView()
            case .component:
                Text("osada")
            }
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
