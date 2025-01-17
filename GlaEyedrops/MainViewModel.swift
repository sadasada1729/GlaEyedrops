//
//  MainViewModel.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/07.
//
// swiftlint:disable type_name
import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    enum VIEW_CONTENT {
        case drugName
        case component
    }

    @Published private(set) var viewContent: VIEW_CONTENT = .drugName { didSet { setTopViewColor() } }
    @Published private(set) var topvViewDrugNameBtnTextColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    @Published private(set) var topvViewDrugNameBtnBackgroundColor = Color(#colorLiteral(red: 0.3103860319, green: 0.5342879295, blue: 0.4702498317, alpha: 1))
    @Published private(set) var topvViewComponentBtnTextColor = Color(#colorLiteral(red: 0.3103860319, green: 0.5342879295, blue: 0.4702498317, alpha: 1))
    @Published private(set) var topvViewComponentBtnBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    let color0 = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let color1 = Color(#colorLiteral(red: 0.8969092965, green: 0.9082003832, blue: 0.9080017805, alpha: 1))
    let color2 = Color(#colorLiteral(red: 0.7320033908, green: 0.8884314895, blue: 0.8983015418, alpha: 1))

    func topViewDrugNameBtnTapped() {
        viewContent = .drugName
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
        case .drugName:
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

// swiftlint:enable type_name
