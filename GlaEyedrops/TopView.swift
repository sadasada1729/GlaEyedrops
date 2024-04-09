//
//  TopView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/07.
//

import Foundation
import SwiftUI

struct TopView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Image("header")
                .resizable()
                .scaledToFit()
            HStack {
                Button {
                    viewModel.topViewDrugNameBtnTapped()
                } label: {
                    Text("薬品名から")
                        .foregroundStyle(viewModel.topvViewDrugNameBtnTextColor)
                        .font(.system(size: 17, weight: .medium))
                        .padding()
                        .frame(minWidth: 120)
                        .background(viewModel.topvViewDrugNameBtnBackgroundColor, in: RoundedRectangle(cornerRadius: 12))
                }
                .compositingGroup()
                .padding()
                Button {
                    viewModel.topViewComponentBtnTapped()
                } label: {
                    Text("成分から")
                        .foregroundStyle(viewModel.topvViewComponentBtnTextColor)
                        .font(.system(size: 17, weight: .medium))
                        .padding()
                        .frame(minWidth: 120)
                        .background(viewModel.topvViewComponentBtnBackgroundColor, in: RoundedRectangle(cornerRadius: 12))
                }
                .compositingGroup()
                .padding()
            }
            .shadow(radius: 4, x: 2, y: 3)
        }
        .background(.white)
    }
}

#Preview {
    MainView()
}
