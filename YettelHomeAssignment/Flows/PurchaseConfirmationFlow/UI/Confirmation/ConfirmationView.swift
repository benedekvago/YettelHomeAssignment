//
//  ConfirmationView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI
import UIComponents

struct ConfirmationView: View {
    
    // This could be a protocol for this view
    @ObservedObject var viewModel: PurchaseConfirmationFlowViewModel

    var body: some View {
        VStack(spacing: Constants.largeSpacing) {
            YettelHeader(title: Localizable.headerTitle) {
                viewModel.popView()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: Constants.largeSpacing) {
                    Group {
                        VStack(spacing: Constants.normalSpacing) {
                            YettelLabel(text: Localizable.confirmPurcahse, fontSize: Constants.largeFontSize, fontWeight: .bold)
                            Separator()
                            ForEach(viewModel.purchaseInfo, id: \.self) { purchaseInfo in
                                HStack {
                                    YettelLabel(text: purchaseInfo.title, fontSize: Constants.smallFontSize, fontWeight: .light)
                                    Spacer()
                                    YettelLabel(text: purchaseInfo.detail, fontSize: Constants.smallFontSize, fontWeight: .light)
                                }
                            }
                            Separator()
                        }
                        VStack(spacing: Constants.normalSpacing) {
                            ForEach(viewModel.purchaseItems, id: \.self) { purchaseItem in
                                HStack {
                                    YettelLabel(text: purchaseItem.name, fontSize: Constants.normalFontSize, fontWeight: .bold)
                                    Spacer()
                                    YettelLabel(text: Localizable.price(purchaseItem.price.formatted()), fontSize: Constants.smallFontSize, fontWeight: .light)
                                }
                            }
                            HStack {
                                YettelLabel(text: Localizable.serviceFee, fontSize: Constants.smallFontSize, fontWeight: .light)
                                Spacer()
                                YettelLabel(text: Localizable.price(viewModel.serviceFee.formatted()), fontSize: Constants.smallFontSize, fontWeight: .light)
                            }
                        }
                    }
                    .padding(.horizontal, Constants.normalSpacing)
                    Separator()
                    Group {
                        VStack(alignment: .leading, spacing: Constants.smallSpacing) {
                            YettelLabel(text: Localizable.sumToPay, fontSize: Constants.extraSmallFontSize, fontWeight: .bold)
                            YettelLabel(text: Localizable.price(viewModel.price.formatted()), fontSize: Constants.extraLargeFontSize, fontWeight: .bold)
                        }
                    }
                    .padding(.horizontal, Constants.normalSpacing)
                    VStack(spacing: Constants.normalSpacing) {
                        YettelButton(title: Localizable.next, style: .primary) {
                            viewModel.confirmPurchase()
                        }
                        YettelButton(title: Localizable.cancel, style: .secondary) {
                            Task {
                                await viewModel.onOkTapped()
                            }
                        }
                    }
                }
                .padding(.horizontal, Constants.normalSpacing)
            }
        }
    }
}

private extension ConfirmationView {
    enum Constants {
        static let smallSpacing: CGFloat = 8
        static let normalSpacing: CGFloat = 16
        static let largeSpacing: CGFloat = 32
        static let extraSmallFontSize: CGFloat = 12
        static let smallFontSize: CGFloat = 14
        static let normalFontSize: CGFloat = 16
        static let largeFontSize: CGFloat = 20
        static let extraLargeFontSize: CGFloat = 40
    }
}
