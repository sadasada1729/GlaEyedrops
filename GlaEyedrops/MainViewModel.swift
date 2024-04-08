//
//  MainViewModel.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/07.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    enum VIEW_CONTENT {
        case drug_name
        case component
    }
    @Published private(set) var viewContent: VIEW_CONTENT = .drug_name { didSet { setTopViewColor() } }
    @Published private(set) var topvViewDrugNameBtnTextColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    @Published private(set) var topvViewDrugNameBtnBackgroundColor = Color(#colorLiteral(red: 0.3103860319, green: 0.5342879295, blue: 0.4702498317, alpha: 1))
    @Published private(set) var topvViewComponentBtnTextColor = Color(#colorLiteral(red: 0.3103860319, green: 0.5342879295, blue: 0.4702498317, alpha: 1))
    @Published private(set) var topvViewComponentBtnBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    
    func topViewDrugNameBtnTapped() {
        viewContent = .drug_name
    }
    
    func topViewComponentBtnTapped() {
        viewContent = .component
    }
    
}

private extension MainViewModel {
    func setTopViewColor() {
        let color1 = Color(#colorLiteral(red: 0.3103860319, green: 0.5342879295, blue: 0.4702498317, alpha: 1))
        let color2 = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        switch viewContent {
        case .drug_name:
            topvViewDrugNameBtnTextColor = color2
            topvViewDrugNameBtnBackgroundColor = color1
            topvViewComponentBtnTextColor = color1
            topvViewComponentBtnBackgroundColor = color2
        case .component:
            topvViewDrugNameBtnTextColor = color1
            topvViewDrugNameBtnBackgroundColor = color2
            topvViewComponentBtnTextColor = color2
            topvViewComponentBtnBackgroundColor = color1
        }
    }
}
    
