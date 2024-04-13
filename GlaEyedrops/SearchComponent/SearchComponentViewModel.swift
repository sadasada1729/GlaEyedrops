//
//  SearchComponentViewModel.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/12.
//

import Foundation
import SwiftUI

class SearchComponentViewModel: ObservableObject {
    
    @Published private(set) var highlightDrugs: [EYEDROPS_COMPONENTS] = []
    let selectComponentViewBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let eyedropsDefaultColor = Color(#colorLiteral(red: 0.3618570566, green: 0.824965179, blue: 0.8113998771, alpha: 1))
    let eyedropsHighlightColor = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))

    func compoentTapped(component: EYEDROPS_COMPONENTS) {
        if highlightDrugs.contains(component) {
            highlightDrugs.removeAll(where: { $0 == component })
        } else {
            highlightDrugs.append(component)
        }
    }
}
