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
}


#Preview {
    MainView()
}
