//
//  SearchDrugViewModel.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/09.
//

import Foundation
import SwiftUI

class SearchDrugViewModel: ObservableObject {
    @Published var currentInput: String = "" { didSet { updateDrugNames() } }
    @Published private(set) var showDrugNameList: Bool = false
    @Published private(set) var drugNameIndexes: [Int] = [] { didSet { updatePopUpState() } }
    @Published private(set) var selectedDrug: String = ""
    @Published private(set) var selectedDrugNum: String = ""
    @Published private(set) var highlightDrugs: [EYEDROPS_COMPONENTS] = []

    let backgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    let tintColor = Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
    let textFieldBackgroundColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    let textFieldBorderColor = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    let selectedDrugTextColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    let selectedDrugNumTextColor = Color(#colorLiteral(red: 0.380572319, green: 0.4768701792, blue: 0.5755326748, alpha: 1))
    let eyedropsDefaultColor = Color(#colorLiteral(red: 0.3618570566, green: 0.824965179, blue: 0.8113998771, alpha: 1))
    let eyedropsHighlightColor = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    let drugNameListBackgroundColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    let drugNameListTextColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let placeholderColor = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))

    func drugName(index: Int) -> String {
        return SearchDrugUseCase.getEyedropsNameFromIndex(index: index) ?? ""
    }

    func drugSelected(index: Int) {
        if let drug = SearchDrugUseCase.getEyedropsNameFromIndex(index: index) {
            selectedDrug = drug
        }
        if let drugNum = SearchDrugUseCase.getEyedropsNumFromIndex(index: index) {
            selectedDrugNum = drugNum + " 回/日"
        }
        currentInput = ""
        highlightDrugs = SearchDrugUseCase.getEyedropsComponentsFromIndex(index: index)
    }
}

private extension SearchDrugViewModel {
    func updateDrugNames() {
        drugNameIndexes = SearchDrugUseCase.getPredictedEyeDropsIndex(text: currentInput)
    }

    func updatePopUpState() {
        if drugNameIndexes.isEmpty {
            showDrugNameList = false
        } else {
            showDrugNameList = true
        }
    }
}
