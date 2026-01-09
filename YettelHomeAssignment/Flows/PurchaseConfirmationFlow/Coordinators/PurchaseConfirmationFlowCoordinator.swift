//
//  PurchaseConfirmationFlowCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

final class PurchaseConfirmationFlowCoordinator: PurchaseConfirmationFlowCoordinatorProtocol {
    
    private var viewModel: PurchaseConfirmationFlowViewModel!
    private var parentCoordinator: PurchaseConfirmationParentCoordinatorProtocol!
    
    func start(
        purchaseInfo: [PurchaseInfo],
        purchaseItems: [PurchaseItem],
        purchaseConfirmationService: PurchaseConfirmationServiceProtocol,
        parentCoordinator: PurchaseConfirmationParentCoordinatorProtocol
    ) {
        viewModel = PurchaseConfirmationFlowViewModel(
            purchaseInfo: purchaseInfo,
            purchaseItems: purchaseItems,
            purchaseConfirmationService: purchaseConfirmationService,
            coordinator: self
        )
        self.parentCoordinator = parentCoordinator
    }
    
    func pushSuccessView() {
        parentCoordinator.pushView(
            view: SuccessfulPurchaseView(
                viewModel: viewModel
            )
        )
    }
    
    func popView() {
        parentCoordinator.popView()
    }
    
    func finishFlow() {
        parentCoordinator.popToRoot()
    }
}

// MARK: FlowProtocol
extension PurchaseConfirmationFlowCoordinator {
    func getFirstView() -> some View {
        ConfirmationView(
            viewModel: viewModel
        )
    }
}
