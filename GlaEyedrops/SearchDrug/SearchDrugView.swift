//
//  SearchDrugView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/09.
//
// swiftlint:disable line_length

import Foundation
import SwiftUI

struct SearchDrugView: View {

    @StateObject private var viewModel = SearchDrugViewModel()
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            textField
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            if !viewModel.selectedDrug.isEmpty {
                selectedDrug
            }
            ZStack(alignment: .top) {
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
        TextField("", text: $viewModel.currentInput)
            .scrollContentBackground(.hidden)
            .padding(EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10))
            .frame(height: 52)
            .foregroundStyle(viewModel.tintColor)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 0.6)
                    .fill(viewModel.textFieldBorderColor)
                textFieldPlaceHolder
            }
            .focused($isFocused)
            .onSubmit {
            }
            .accessibility(identifier: "uitest.bottomview.texteditor")
    }

    var textFieldPlaceHolder: some View {
        ZStack {
            if viewModel.currentInput.isEmpty {
                HStack {
                    Text("点眼薬名を入力")
                        .allowsHitTesting(false)
                        .foregroundColor(viewModel.placeholderColor)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    Spacer()
                }
            }
        }
    }

    var selectedDrug: some View {
        HStack {
            Text(viewModel.selectedDrug)
                .foregroundStyle(viewModel.selectedDrugTextColor)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                .font(.subheadline)
            Text(viewModel.selectedDrugNum)
                .foregroundStyle(viewModel.selectedDrugNumTextColor)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                .font(.system(size: 15))
        }
    }

    var eyedropsIcon1: some View {
        Image("eyedrops_PG")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.pg) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var eyedropsIcon2: some View {
        Image("eyedrops_beta")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.beta) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var eyedropsIcon3: some View {
        Image("eyedrops_CAI")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.cai) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var eyedropsIcon4: some View {
        Image("eyedrops_alpha1")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.alpha1) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var eyedropsIcon5: some View {
        Image("eyedrops_alpha2")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.alpha2) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var eyedropsIcon6: some View {
        Image("eyedrops_Rho")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.rho) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var eyedropsIcon7: some View {
        Image("eyedrops_EP2")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 70)
            .foregroundStyle(viewModel.highlightDrugs.contains(.ep2) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
    }

    var drugNameList: some View {
        List {
            ForEach(viewModel.drugNameIndexes, id: \.self) { index in
                Button(action: {
                    viewModel.drugSelected(index: index)
                    isFocused = false
                }, label: {
                    Text(viewModel.drugName(index: index))
                        .foregroundStyle(viewModel.drugNameListTextColor)
                })
                .listRowBackground(viewModel.drugNameListBackgroundColor)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .listStyle(.inset)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
    }
}

#Preview {
    MainView()
}

// swiftlint:enable line_length
