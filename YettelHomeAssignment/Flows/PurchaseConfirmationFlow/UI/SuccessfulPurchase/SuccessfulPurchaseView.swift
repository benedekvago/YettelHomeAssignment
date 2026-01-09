//
//  SuccessfulPurchaseView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI
import UIComponents

struct SuccessfulPurchaseView: View {
    @ObservedObject var viewModel: PurchaseConfirmationFlowViewModel

    var body: some View {
        ZStack {
            Assets.successBackground
                .ignoresSafeArea()
            VStack(spacing: Constants.largeSpacing) {
                Spacer()
                HStack {
                    YettelLabel(text: Localizable.successfulPayment, fontSize: Constants.extraLargeFontSize, fontWeight: .bold, multilineTextAlignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, Constants.largeSpacing)
                HStack {
                    Spacer()
                    Assets.pictogram
                }
                YettelButton(title: Localizable.ok, style: .primary) {
                    Task {
                        await viewModel.onOkTapped()
                    }
                }
                .padding(.horizontal, Constants.largeSpacing)
            }
            VStack {
                Assets.confetti
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

private extension SuccessfulPurchaseView {
    enum Constants {
        static let largeSpacing: CGFloat = 32
        static let extraLargeFontSize: CGFloat = 40
    }
}
