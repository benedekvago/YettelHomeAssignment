//
//  SuccessfulPurchaseView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI
import UIComponents

struct SuccessfulPurchaseView: View {
    // This could be a protocol for this view
    @ObservedObject var viewModel: PurchaseConfirmationFlowViewModel

    var body: some View {
        ZStack {
            Color("successBackground")
                .ignoresSafeArea()
            VStack(spacing: Constants.largeSpacing) {
                Spacer()
                HStack {
                    YettelLabel(text: "A matricákat sikeresen kifizetted!", fontSize: Constants.extraLargeFontSize, fontWeight: .bold, multilineTextAlignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, Constants.largeSpacing)
                HStack {
                    Spacer()
                    Image("pictogram")
                }
                YettelButton(title: "Rendben", style: .primary) {
                    Task {
                        await viewModel.onOkTapped()
                    }
                }
                .padding(.horizontal, Constants.largeSpacing)
            }
            VStack {
                Image("confetti")
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
