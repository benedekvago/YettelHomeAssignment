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
        VStack(spacing: 32) {
            YettelHeader {
                viewModel.popView()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    Group {
                        YettelLabel(text: "Éves vármegyei matricák", fontSize: 20, fontWeight: .bold)
                            .padding(.horizontal, 16)
                        if let shireVignettes = viewModel.shireVignettes {
                            VStack(spacing: 16) {
                                ForEach(shireVignettes, id: \.self) { vignette in
                                    MultiSelectComponent(isSelected: viewModel.selectedShireVignettes.contains(vignette), title: vignette.name, additionalInfo: "\(vignette.price) Ft")
                                        .onTapGesture {
                                            viewModel.didTapShireVignette(vignette: vignette)
                                        }
                                }
                            }
                        }
                        Separator()
                        VStack(spacing: 8) {
                            YettelLabel(text: "Fizetendő összeg", fontSize: 12, fontWeight: .bold)
                            YettelLabel(text: "\(viewModel.shireVignettesPrice) Ft", fontSize: 40, fontWeight: .bold)
                        }
                    }
                    .padding(.horizontal, 16)
                    YettelButton(title: "Vásárlás", style: .primary) {
                        viewModel.startShirePurcahseConfirmationFlow()
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
