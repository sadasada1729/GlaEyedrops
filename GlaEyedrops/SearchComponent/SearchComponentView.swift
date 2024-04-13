//
//  SearchComponentView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/12.
//

import Foundation
import SwiftUI

struct SearchComponentView: View {
    
    @StateObject private var viewModel = SearchComponentViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            selectComponentView
        }
    }
}

private extension SearchComponentView {
    var selectComponentView: some View {
        VStack {
            HStack {
                eyedropsIcon1
                eyedropsIcon2
                eyedropsIcon3
                eyedropsIcon4
            }
            HStack {
                eyedropsIcon5
                eyedropsIcon6
                eyedropsIcon7
            }
        }
        .padding()
        .background(viewModel.selectComponentViewBackgroundColor, in: RoundedRectangle(cornerRadius: 12))
        .compositingGroup()
        .shadow(radius: 4, x: 3, y: 4)
    }
    
    var eyedropsIcon1: some View {
        Image("eyedrops_pg_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.pg) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .pg)
            }
    }
    
    var eyedropsIcon2: some View {
        Image("eyedrops_beta_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.beta) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .beta)
            }
    }
    
    var eyedropsIcon3: some View {
        Image("eyedrops_cai_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.cai) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .cai)
            }
    }
    
    var eyedropsIcon4: some View {
        Image("eyedrops_alpha1_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.alpha1) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .alpha1)
            }
    }
    
    var eyedropsIcon5: some View {
        Image("eyedrops_alpha2_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.alpha2) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .alpha2)
            }
    }
    
    var eyedropsIcon6: some View {
        Image("eyedrops_rho_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.rho) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .rho)
            }
    }
    
    var eyedropsIcon7: some View {
        Image("eyedrops_ep2_wide")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 50)
            .foregroundStyle(viewModel.highlightDrugs.contains(.ep2) ? viewModel.eyedropsHighlightColor : viewModel.eyedropsDefaultColor)
            .onTapGesture {
                viewModel.compoentTapped(component: .ep2)
            }
    }

}

#Preview {
    SearchComponentView()
}
