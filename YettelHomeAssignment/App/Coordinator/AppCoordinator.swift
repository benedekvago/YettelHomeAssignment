//
//  AppCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    private let vignetteSelectionFlow: any VignetteSelectionFlowCoordinatorProtocol = VignetteSelectionFlowCoordinator()
    private let purchaseConfimationFlow: any PurchaseConfirmationFlowCoordinatorProtocol = PurchaseConfirmationFlowCoordinator()
    
    func start() {
        vignetteSelectionFlow.start(vignetteSelectionService: VignetteSelectionService())
        if path.isEmpty {
            startVignetteSelectionFlow()
        }
    }
}

// MARK: VignetteSelectionParentCoordinatorProtocol
extension AppCoordinator: VignetteSelectionParentCoordinatorProtocol {}

// MARK: PurcahseConfirmationParentCoordinatorProtocol
extension AppCoordinator: PurcahseConfirmationParentCoordinatorProtocol {}

// MARK: Helpers
private extension AppCoordinator {
    func startVignetteSelectionFlow() {
        path.append(AnyFlowRoute {
            return AnyView(
                // Could this lead to memory leak?
                self.vignetteSelectionFlow.getFirstView()
            )
        })
    }

    func startPurchaseConfimationFlow() {
        path.append(AnyFlowRoute {
            return AnyView(
                // Could this lead to memory leak?
                self.purchaseConfimationFlow.getFirstView()
            )
        })
    }
}
