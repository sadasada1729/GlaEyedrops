//
//  SearchComponentViewModel.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/12.
//
// swiftlint:disable line_length

import Foundation
import SwiftUI

class SearchComponentViewModel: ObservableObject {
    @Published private(set) var selectedComponents: [EYEDROPS_COMPONENTS] = [] { didSet { selectedComponentsDidChanged() } }
    @Published private(set) var selectedDrugs: [Int] = []

    let selectComponentViewBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let eyedropsDefaultColor1 = Color(#colorLiteral(red: 0.3618570566, green: 0.824965179, blue: 0.8113998771, alpha: 1))
    let eyedropsHighlightColor1 = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    let drugNameListBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4))
    let eyedropsDefaultColor2 = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let eyedropsHighlightColor2 = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    let eyedropsNameTextColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))

    func compoentTapped(component: EYEDROPS_COMPONENTS) {
        if selectedComponents.contains(component) {
            selectedComponents.removeAll(where: { $0 == component })
        } else {
            selectedComponents.append(component)
        }
    }

    func getDrugName(index: Int) -> String {
        SearchComponentUseCase.getDrugName(index: index) ?? ""
    }

    func getDrugComponents(index: Int) -> [EYEDROPS_COMPONENTS] {
        SearchDrugUseCase.getEyedropsComponentsFromIndex(index: index)
    }
}

private extension SearchComponentViewModel {
    func selectedComponentsDidChanged() {
        selectedDrugs = SearchComponentUseCase.getDrugsContainSelectedComponents(components: selectedComponents)
    }
}

// swiftlint:enable line_length
