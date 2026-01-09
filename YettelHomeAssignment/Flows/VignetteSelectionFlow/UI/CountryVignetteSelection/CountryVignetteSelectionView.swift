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
            VStack(spacing: 12) {
                YettelCard {
                    HStack {
                        Image("carIcon")
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .padding(.horizontal, 16)
                        VStack(alignment: .leading) {
                            YettelLabel(
                                text: viewModel.vehicle?.plate ?? "",
                                fontWeight: .regular,
                            )
                            YettelLabel(
                                text: viewModel.vehicle?.owner ?? "",
                                fontSize: 12,
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
                            fontSize: 20,
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
            .padding(.horizontal, 16)
        }
        .background(Color("background"))
        .safeAreaInset(edge: .top) {               // 👈 attach header here
            YettelHeader {
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
