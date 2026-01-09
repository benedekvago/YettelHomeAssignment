//
//  ShireVignetteSelectionView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import UIComponents
import SwiftUI

struct ShireVignetteSelectionView: View {
    // This could be a protocol for this view
    @ObservedObject var viewModel: VignetteSelectionFlowViewModel

    var body: some View {
        VStack(spacing: Constants.largeSpacing) {
            YettelHeader(title: Localizable.headerTitle) {
                viewModel.popView()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: Constants.largeSpacing) {
                    Group {
                        groupView
                    }
                    .padding(.horizontal, Constants.normalSpacing)
                    YettelButton(title: Localizable.pay, style: .primary) {
                        viewModel.startShirePurcahseConfirmationFlow()
                    }
                }
                .padding(.horizontal, Constants.normalSpacing)
            }
        }
    }
    
    @ViewBuilder
    var groupView: some View {
        YettelLabel(text: Localizable.shireVignettes, fontSize: Constants.normalFontSize, fontWeight: .bold)
            .padding(.horizontal, Constants.normalSpacing)
        if let shireVignettes = viewModel.shireVignettes {
            VStack(spacing: Constants.normalSpacing) {
                ForEach(shireVignettes, id: \.self) { vignette in
                    MultiSelectComponent(isSelected: viewModel.selectedShireVignettes.contains(vignette), title: vignette.name, additionalInfo: Localizable.price(vignette.price.formatted()))
                        .onTapGesture {
                            viewModel.didTapShireVignette(vignette: vignette)
                        }
                }
            }
        }
        Separator()
        VStack(alignment: .leading, spacing: Constants.smallSpacing) {
            YettelLabel(text: Localizable.sumToPay, fontSize: Constants.smallFontSize, fontWeight: .bold)
            YettelLabel(text: Localizable.price(viewModel.shireVignettesPrice.formatted()), fontSize: Constants.largeFontSize, fontWeight: .bold)
        }
    }
}

private extension ShireVignetteSelectionView {
    enum Constants {
        static let smallSpacing: CGFloat = 8
        static let normalSpacing: CGFloat = 16
        static let largeSpacing: CGFloat = 32
        static let smallFontSize: CGFloat = 12
        static let normalFontSize: CGFloat = 20
        static let largeFontSize: CGFloat = 40
    }
}
