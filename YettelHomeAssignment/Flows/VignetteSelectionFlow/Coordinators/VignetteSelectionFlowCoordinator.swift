//
//  VignetteSelectionFlowCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

final class VignetteSelectionFlowCoordinator: VignetteSelectionFlowCoordinatorProtocol {
    private var viewModel: VignetteSelectionFlowViewModel!
    private var parentCoordinator: VignetteSelectionParentCoordinatorProtocol!
    
    func start(vignetteSelectionService: VignetteSelectionServiceProtocol, parentCoordinator: VignetteSelectionParentCoordinatorProtocol) {
        // Register dependencies
        viewModel = VignetteSelectionFlowViewModel(vignetteSelectionService: vignetteSelectionService, coordinator: self)
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
