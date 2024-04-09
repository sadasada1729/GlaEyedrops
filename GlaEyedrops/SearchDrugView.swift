//
//  SearchDrugView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/09.
//

import Foundation
import SwiftUI

struct SearchDrugView: View {
    
    @StateObject private var viewModel = SearchDrugViewModel()
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack {
            textField
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            ZStack {
                VStack {
                    HStack {
                        eyedropsIcon1
                        eyedropsIcon2
                        eyedropsIcon3
                        eyedropsIcon4
                    }
                    .padding()
                    HStack {
                        eyedropsIcon5
                        eyedropsIcon6
                        eyedropsIcon7
                    }
                    .padding()
                }
                .background(viewModel.backgroundColor, in: RoundedRectangle(cornerRadius: 18))
                .compositingGroup()
                .shadow(radius: 4, x: 3, y: 4)
                if viewModel.showDrugNameList {
                    drugNameList
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

private extension SearchDrugView {
    var textField: some View {
        TextField("点眼薬名を入力", text: $viewModel.currentInput)
            .scrollContentBackground(.hidden)
            .padding(EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10))
            .frame(height: 52)
            .foregroundStyle(viewModel.tintColor)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 0.6)
                    .fill(viewModel.textFieldBorderColor)
            }
            .focused($isFocused)
            .onSubmit {
            }
            .accessibility(identifier: "uitest.bottomview.texteditor")
    }
    
    var eyedropsIcon1: some View {
        Image("eyedrops_PG")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsHighlightColor)
    }
    
    var eyedropsIcon2: some View {
        Image("eyedrops_beta")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsDefaultColor)
    }
    
    var eyedropsIcon3: some View {
        Image("eyedrops_CAI")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsDefaultColor)
    }
    
    var eyedropsIcon4: some View {
        Image("eyedrops_alpha1")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsDefaultColor)
    }
    
    var eyedropsIcon5: some View {
        Image("eyedrops_alpha2")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsHighlightColor)
    }
    
    var eyedropsIcon6: some View {
        Image("eyedrops_Rho")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsDefaultColor)
    }
    
    var eyedropsIcon7: some View {
        Image("eyedrops_EP2")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.eyedropsDefaultColor)
    }
    
    var drugNameList: some View {
        List {
            ForEach(viewModel.drugNames, id: \.self) { drugName in
                Text(drugName)
            }
        }
        .buttonStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
    }

}


#Preview {
    MainView()
}
