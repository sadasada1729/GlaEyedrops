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
    @Published private(set) var drugNames: [String] = [] { didSet { updatePopUpState() } }
    
    private var drugNameIndexes: [Int] = []
    
    let backgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    
    let tintColor = Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
    let textFieldBackgroundColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    let textFieldBorderColor = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    
    let eyedropsDefaultColor = Color(#colorLiteral(red: 0.3618570566, green: 0.824965179, blue: 0.8113998771, alpha: 1))
    let eyedropsHighlightColor = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
}

private extension SearchDrugViewModel {
    func updateDrugNames() {
        drugNameIndexes = SearchDrugUseCase.getPredictedEyeDropsIndex(text: currentInput)
        drugNames = drugNameIndexes.map { SearchDrugUseCase.getEyedropsNameFromIndex(index: $0) }.filter{ $0 != nil }.map{ $0! }
    }
    
    func updatePopUpState() {
        if drugNames.isEmpty {
            showDrugNameList = false
        } else {
            showDrugNameList = true
        }
        
    }
}
