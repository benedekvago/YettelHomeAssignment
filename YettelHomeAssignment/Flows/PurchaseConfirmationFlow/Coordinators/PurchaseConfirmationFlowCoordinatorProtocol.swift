//
//  PurchaseConfirmationFlowCoordinatorProtocol.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

protocol PurchaseConfirmationFlowCoordinatorProtocol: FlowProtocol {
    func start(
        purchaseInfo: [PurchaseInfo],
        purchaseItems: [PurchaseItem],
        purchaseConfirmationService: PurchaseConfirmationServiceProtocol,
        parentCoordinator: PurchaseConfirmationParentCoordinatorProtocol
    )
    func pushSuccessView()
    func popView()
    func finishFlow()
}
