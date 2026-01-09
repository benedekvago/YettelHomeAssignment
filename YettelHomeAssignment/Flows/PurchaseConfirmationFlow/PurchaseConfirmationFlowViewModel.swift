//
//  PurchaseConfirmationFlowViewModel.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Combine
import Foundation

class PurchaseConfirmationFlowViewModel: ObservableObject {
    private let purchaseConfirmationService: PurchaseConfirmationServiceProtocol
    private let coordinator: any PurchaseConfirmationFlowCoordinatorProtocol
    
    @Published var purchaseInfo: [PurchaseInfo]
    @Published var purchaseItems: [PurchaseItem]
    @Published var serviceFee: Decimal = 200
    
    var price: Decimal {
        purchaseItems.reduce(0) { $0 + $1.price } + serviceFee
    }
    
    init(
        purchaseInfo: [PurchaseInfo],
        purchaseItems: [PurchaseItem],
        purchaseConfirmationService: PurchaseConfirmationServiceProtocol,
        coordinator: any PurchaseConfirmationFlowCoordinatorProtocol
    ) {
        self.purchaseInfo = purchaseInfo
        self.purchaseItems = purchaseItems
        self.purchaseConfirmationService = purchaseConfirmationService
        self.coordinator = coordinator
    }
    
    func confirmPurchase() {
        coordinator.pushSuccessView()
    }
    
    func onOkTapped() async {
        try? await purchaseConfirmationService.confirmPurchase()
        await MainActor.run {
            coordinator.finishFlow()
        }
    }
    
    func popView() {
        coordinator.popView()
    }
}
