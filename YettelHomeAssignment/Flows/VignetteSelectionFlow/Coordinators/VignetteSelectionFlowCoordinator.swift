//
//  VignetteSelectionFlowCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

final class VignetteSelectionFlowCoordinator: VignetteSelectionFlowCoordinatorProtocol {
    private var viewModel: VignetteSelectionFlowViewModel!
    
    func start(vignetteSelectionService: VignetteSelectionServiceProtocol) {
        // Register dependencies
        viewModel = VignetteSelectionFlowViewModel(vignetteSelectionService: vignetteSelectionService, coordinator: self)
    }
    
    func pushShireView() {
        
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
