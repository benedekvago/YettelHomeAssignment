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
                        Assets.carIcon
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
                            text: Localizable.countryVignettes,
                            fontSize: Constants.largeFontSize,
                            fontWeight: .bold
                        )

                        if let countryVignettes = viewModel.countryVignettes {
                            ForEach(countryVignettes, id: \.self) { vignette in
                                let title = switch vignette.type {
                                case .country(let type):
                                    type.localized
                                default:
                                    vignette.type.title
                                }
                                SingleSelectComponent(
                                    isSelected: viewModel.selectedCountryVignette == vignette,
                                    title: title,
                                    additionalInfo: Localizable.price(vignette.price.formatted())
                                )
                                .onTapGesture {
                                    viewModel.didSelectContryVignette(vignette: vignette)
                                }
                            }
                        }

                        YettelButton(title: Localizable.pay, style: .primary) {
                            viewModel.startCountryPurcahseConfirmationFlow()
                        }
                    }
                }

                NavigationBox(title: Localizable.shireVignettes)
                    .onTapGesture {
                        viewModel.openShireView()
                    }
            }
            .padding(.horizontal, Constants.normalSpacing)
        }
        .background(Assets.background)
        .safeAreaInset(edge: .top) {
            YettelHeader(title: Localizable.headerTitle) {
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

private extension Vignette.CountryType {
    var localized: String {
        switch self {
        case .day: Localizable.countryVignetteDay
        case .week: Localizable.countryVignetteWeek
        case .month: Localizable.countryVignetteMonth
        case .year: Localizable.countryVignetteYear
        }
    }
}
