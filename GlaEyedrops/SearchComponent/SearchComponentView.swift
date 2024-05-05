//
//  SearchComponentView.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/12.
//
// swiftlint:disable line_length

import Foundation
import SwiftUI

struct SearchComponentView: View {

    @StateObject private var viewModel = SearchComponentViewModel()
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            selectComponentView
            drugsViewList
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
            .foregroundStyle(viewModel.selectedComponents.contains(.pg) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
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
            .foregroundStyle(viewModel.selectedComponents.contains(.beta) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
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
            .foregroundStyle(viewModel.selectedComponents.contains(.cai) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
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
            .foregroundStyle(viewModel.selectedComponents.contains(.alpha1) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
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
            .foregroundStyle(viewModel.selectedComponents.contains(.alpha2) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
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
            .foregroundStyle(viewModel.selectedComponents.contains(.rho) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
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
            .foregroundStyle(viewModel.selectedComponents.contains(.ep2) ? viewModel.eyedropsHighlightColor1 : viewModel.eyedropsDefaultColor1)
            .onTapGesture {
                viewModel.compoentTapped(component: .ep2)
            }
    }

    var drugsViewList: some View {
        List {
            ForEach(viewModel.selectedDrugs, id: \.self) { index in
                HStack {
                    Spacer()
                    Text(viewModel.getDrugName(index: index))
                        .frame(width: 135)
                        .foregroundStyle(viewModel.eyedropsNameTextColor)
                    HStack {
                        Image("eyedrops_pg_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.pg) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                        Image("eyedrops_beta_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.beta) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                        Image("eyedrops_cai_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.cai) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                        Image("eyedrops_alpha1_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.alpha1) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                        Image("eyedrops_alpha2_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.alpha2) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                        Image("eyedrops_rho_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.rho) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                        Image("eyedrops_ep2_wide")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                            .foregroundStyle(viewModel.getDrugComponents(index: index).contains(.ep2) ? viewModel.eyedropsHighlightColor2 : viewModel.eyedropsDefaultColor2)
                    }
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden, edges: .top)
                .listSectionSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
            }
        }
        .listStyle(.inset)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(viewModel.drugNameListBackgroundColor, in: RoundedRectangle(cornerRadius: 12))
        .clipped()
        .padding()
    }
}

#Preview {
    MainView()
}

// swiftlint:enable line_length
