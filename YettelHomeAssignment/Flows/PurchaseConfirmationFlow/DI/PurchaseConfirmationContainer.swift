//
//  PurchaseConfirmationContainer.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import Factory

extension Container {    
    var purchaseConfirmationFlowViewModel: ParameterFactory<([PurchaseInfo], [PurchaseItem], PurchaseConfirmationServiceProtocol, any PurchaseConfirmationFlowCoordinatorProtocol), PurchaseConfirmationFlowViewModel> {
        self { (purchaseInfo, purchaseItems, purchaseConfirmationService, coordinator) in
            PurchaseConfirmationFlowViewModel(
                purchaseInfo: purchaseInfo,
                purchaseItems: purchaseItems,
                purchaseConfirmationService: purchaseConfirmationService,
                coordinator: coordinator
            )
        }
    }
}
