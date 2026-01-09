//
//  VignetteSelectionParentCoordinatorProtocol.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

protocol VignetteSelectionParentCoordinatorProtocol: ParentFlowProtocol {
    func startPurcahseConfirmationFlow(vehicle: Vehicle, vignettes: [Vignette])
}
