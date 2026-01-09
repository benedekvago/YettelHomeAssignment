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
        VStack(spacing: 32) {
            YettelHeader {
                viewModel.popView()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    Group {
                        VStack(spacing: 16) {
                            YettelLabel(text: "Vásárlás megerősítése", fontSize: 20, fontWeight: .bold)
                            Separator()
                            ForEach(viewModel.purchaseInfo, id: \.self) { purchaseInfo in
                                HStack {
                                    YettelLabel(text: purchaseInfo.title, fontSize: 14, fontWeight: .light)
                                    Spacer()
                                    YettelLabel(text: purchaseInfo.detail, fontSize: 14, fontWeight: .light)
                                }
                            }
                            Separator()
                        }
                        VStack(spacing: 16) {
                            ForEach(viewModel.purchaseItems, id: \.self) { purchaseItem in
                                HStack {
                                    YettelLabel(text: purchaseItem.name, fontSize: 16, fontWeight: .bold)
                                    Spacer()
                                    YettelLabel(text: "\(purchaseItem.price) Ft", fontSize: 14, fontWeight: .light)
                                }
                            }
                            HStack {
                                YettelLabel(text: "Rendszerhasználati díj", fontSize: 14, fontWeight: .light)
                                Spacer()
                                YettelLabel(text: "\(viewModel.serviceFee) Ft", fontSize: 14, fontWeight: .light)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    Separator()
                    Group {
                        VStack(alignment: .leading, spacing: 8) {
                            YettelLabel(text: "Fizetendő összeg", fontSize: 12, fontWeight: .bold)
                            YettelLabel(text: "\(viewModel.price) Ft", fontSize: 40, fontWeight: .bold)
                        }
                    }
                    .padding(.horizontal, 16)
                    VStack(spacing: 16) {
                        YettelButton(title: "Tovább", style: .primary) {
                            viewModel.confirmPurchase()
                        }
                        YettelButton(title: "Mégsem", style: .secondary) {
                            Task {
                                await viewModel.onOkTapped()
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
