//
//  VignetteSelectionFlowCoordinatorProtocol.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

protocol VignetteSelectionFlowCoordinatorProtocol: FlowProtocol {
    func start(vignetteSelectionService: VignetteSelectionServiceProtocol)
    func pushShireView()
}
