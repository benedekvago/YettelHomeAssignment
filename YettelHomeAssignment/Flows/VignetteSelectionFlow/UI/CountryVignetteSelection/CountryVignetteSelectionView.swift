//
//  CountryVignetteSelectionView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import UIComponents
import SwiftUI

struct CountryVignetteSelectionView: View {
    @ObservedObject var viewModel: VignetteSelectionFlowViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: Constants.smallSpacing) {
                YettelCard {
                    HStack {
                        Image("carIcon")
                            .renderingMode(.template)
                            .frame(width: Constants.iconSize, height: Constants.iconSize)
                            .padding(.horizontal, Constants.normalSpacing)
                        VStack(alignment: .leading) {
                            YettelLabel(
                                text: viewModel.vehicle?.plate ?? "",
                                fontWeight: .regular,
                            )
                            YettelLabel(
                                text: viewModel.vehicle?.owner ?? "",
                                fontSize: Constants.smallFontSize,
                                fontWeight: .light,
                            )
                        }
                        Spacer()
                    }
                }

                YettelCard {
                    VStack(alignment: .leading) {
                        YettelLabel(
                            text: "Országos matricák",
                            fontSize: Constants.largeFontSize,
                            fontWeight: .bold
                        )

                        if let countryVignettes = viewModel.countryVignettes {
                            ForEach(countryVignettes, id: \.self) { vignette in
                                SingleSelectComponent(
                                    isSelected: viewModel.selectedCountryVignette == vignette,
                                    title: vignette.name,
                                    additionalInfo: "\(vignette.price) Ft"
                                )
                                .onTapGesture {
                                    viewModel.didSelectContryVignette(vignette: vignette)
                                }
                            }
                        }

                        YettelButton(title: "Vásárlás", style: .primary) {
                            viewModel.startCountryPurcahseConfirmationFlow()
                        }
                    }
                }

                NavigationBox(title: "Éves vármegyei matricák")
                    .onTapGesture {
                        viewModel.openShireView()
                    }
            }
            .padding(.horizontal, Constants.normalSpacing)
        }
        .background(Color("background"))
        .safeAreaInset(edge: .top) {
            YettelHeader(title: "E-matrica") {
                viewModel.popView()
            }
        }
        .onAppear {
            Task {
                await viewModel.loadVignettes()
            }
        }
    }
}

private extension CountryVignetteSelectionView {
    enum Constants {
        static let smallSpacing: CGFloat = 12
        static let normalSpacing: CGFloat = 16
        static let smallFontSize: CGFloat = 12
        static let largeFontSize: CGFloat = 20
        static let iconSize: CGFloat = 24
    }
}
