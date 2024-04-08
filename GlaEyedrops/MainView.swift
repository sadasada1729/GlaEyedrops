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
            Spacer()
            Text("osada")
        }
    }
}

#Preview {
    MainView()
}
