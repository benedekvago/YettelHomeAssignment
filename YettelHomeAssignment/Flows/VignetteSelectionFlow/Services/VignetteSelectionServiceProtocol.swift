//
//  VignetteSelectionServiceProtocol.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

protocol VignetteSelectionServiceProtocol {
    func fetchVehicle() async throws -> Vehicle
    func fetchAvailableVignettes() async throws -> [Vignette]
}
