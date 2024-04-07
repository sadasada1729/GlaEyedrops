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
    @Published private(set) var viewContent: VIEW_CONTENT = .drug_name
    
    let topvViewBtnTextColor = Color(#colorLiteral(red: 0.3103860319, green: 0.5342879295, blue: 0.4702498317, alpha: 1))
    let topvViewBtnBackgroundColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
}
    
