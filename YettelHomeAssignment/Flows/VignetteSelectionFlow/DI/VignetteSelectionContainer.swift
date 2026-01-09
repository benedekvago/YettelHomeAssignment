//
//  VignetteSelectionContainer.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import Factory

extension Container {
    var vignetteSelectionFlowViewModel: ParameterFactory<(VignetteSelectionServiceProtocol, any VignetteSelectionFlowCoordinatorProtocol), VignetteSelectionFlowViewModel> {
        self { (vignetteSelectionService, coordinator) in
            VignetteSelectionFlowViewModel(vignetteSelectionService: vignetteSelectionService, coordinator: coordinator)
        }
    }
}
