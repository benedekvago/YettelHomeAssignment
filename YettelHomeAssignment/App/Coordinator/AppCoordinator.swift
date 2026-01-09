//
//  AppCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Factory
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    private let vignetteSelectionFlow: any VignetteSelectionFlowCoordinatorProtocol = Container.shared.vignetteSelectionFlowCoordinator()
    private let purchaseConfimationFlow: any PurchaseConfirmationFlowCoordinatorProtocol = Container.shared.purchaseConfirmationFlowCoordinator()
    
    func start() {
        vignetteSelectionFlow.start(
            vignetteSelectionService: Container.shared.vignetteSelectionService(),
            parentCoordinator: self
        )
        if path.isEmpty {
            startVignetteSelectionFlow()
        }
    }
}

// MARK: ParentFlowProtocol
extension AppCoordinator: ParentFlowProtocol {
    func pushView(view: some View) {
        path.append(AnyFlowRoute {
            AnyView(
                view
            )
        })
    }
    
    func popView() {
        if path.count <= 1 { return }
        path.removeLast()
    }
    
    func popToRoot() {
        if path.isEmpty { return }
        let viewsToRoot = path.count-1
        path.removeLast(viewsToRoot)
    }
}

// MARK: VignetteSelectionParentCoordinatorProtocol
extension AppCoordinator: VignetteSelectionParentCoordinatorProtocol {
    func startPurcahseConfirmationFlow(vehicle: Vehicle, vignettes: [Vignette]) {
        let (purchaseInfo, purchaseItems) = VignetteToPurchaseMapper.map(vehicle: vehicle, vignettes: vignettes)
        purchaseConfimationFlow.start(
            purchaseInfo: purchaseInfo,
            purchaseItems: purchaseItems,
            purchaseConfirmationService: Container.shared.purchaseConfirmationService(),
            parentCoordinator: self
        )
        startPurchaseConfimationFlow()
    }
}

// MARK: PurcahseConfirmationParentCoordinatorProtocol
extension AppCoordinator: PurchaseConfirmationParentCoordinatorProtocol {}

// MARK: Helpers
private extension AppCoordinator {
    func startVignetteSelectionFlow() {
        path.append(AnyFlowRoute {
            AnyView(
                self.vignetteSelectionFlow.getFirstView()
            )
        })
    }

    func startPurchaseConfimationFlow() {
        path.append(AnyFlowRoute {
            AnyView(
                self.purchaseConfimationFlow.getFirstView()
            )
        })
    }
}
