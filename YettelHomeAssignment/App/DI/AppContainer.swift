//
//  AppContainer.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import Factory

extension Container {
    // App coordinator
    var appCoordinator: Factory<AppCoordinator> {
        Factory(self) { AppCoordinator() }
    }
    // Flow coordinators
    var vignetteSelectionFlowCoordinator: Factory<any VignetteSelectionFlowCoordinatorProtocol> {
        Factory(self) { VignetteSelectionFlowCoordinator() }
    }
    
    var purchaseConfirmationFlowCoordinator: Factory<any PurchaseConfirmationFlowCoordinatorProtocol> {
        Factory(self) { PurchaseConfirmationFlowCoordinator() }
    }
    
    // Services
    var vignetteSelectionService: Factory<any VignetteSelectionServiceProtocol> {
        Factory(self) { VignetteSelectionService() }
    }
    
    var purchaseConfirmationService: Factory<any PurchaseConfirmationServiceProtocol> {
        Factory(self) { PurchaseConfirmationService() }
    }
}
