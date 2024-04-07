//
//  TopView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/07.
//

import Foundation
import SwiftUI

struct TopView: View {
    var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Image("header")
                .resizable()
                .scaledToFit()
            HStack {
                Button {
                    
                } label: {
                    Text("薬品名から")
                        .foregroundStyle(viewModel.topvViewBtnTextColor)
                        .padding()
                        .background(viewModel.topvViewBtnBackgroundColor, in: RoundedRectangle(cornerRadius: 12))
                }
                .compositingGroup()
                .padding()
                Button {
                    
                } label: {
                    Text("薬品名から")
                        .foregroundStyle(viewModel.topvViewBtnTextColor)
                        .padding()
                        .background(viewModel.topvViewBtnBackgroundColor, in: RoundedRectangle(cornerRadius: 12))
                }
                .compositingGroup()
                .padding()
            }
            .shadow(radius: 4, x: 2, y: 3)
        }
        .clipped()
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
