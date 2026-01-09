//
//  VignetteSelectionFlowCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Factory
import SwiftUI

final class VignetteSelectionFlowCoordinator: VignetteSelectionFlowCoordinatorProtocol {
    private var viewModel: VignetteSelectionFlowViewModel!
    private var parentCoordinator: VignetteSelectionParentCoordinatorProtocol!
    
    func start(vignetteSelectionService: VignetteSelectionServiceProtocol, parentCoordinator: VignetteSelectionParentCoordinatorProtocol) {
        viewModel = Container.shared.vignetteSelectionFlowViewModel((vignetteSelectionService, self))
        self.parentCoordinator = parentCoordinator
    }
    
    func pushShireView() {
        parentCoordinator.pushView(view: ShireVignetteSelectionView(viewModel: viewModel))
    }
    
    func startPurcahseConfirmationFlow(vehicle: Vehicle, vignettes: [Vignette]) {
        parentCoordinator.startPurcahseConfirmationFlow(vehicle: vehicle, vignettes: vignettes)
    }
    
    func popView() {
        parentCoordinator.popView()
    }
}

// MARK: FlowProtocol
extension VignetteSelectionFlowCoordinator {
    func getFirstView() -> some View {
        CountryVignetteSelectionView(
            viewModel: viewModel
        )
    }
}
