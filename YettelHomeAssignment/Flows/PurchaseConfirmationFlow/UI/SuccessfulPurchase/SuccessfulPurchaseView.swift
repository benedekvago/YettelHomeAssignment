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
            VStack(spacing: 32) {
                Spacer()
                HStack {
                    YettelLabel(text: "A matricákat sikeresen kifizetted!", fontSize: 40, fontWeight: .bold, multilineTextAlignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, 32)
                HStack {
                    Spacer()
                    Image("pictogram")
                }
                YettelButton(title: "Rendben", style: .primary) {
                    Task {
                        await viewModel.onOkTapped()
                    }
                }
                .padding(.horizontal, 32)
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
