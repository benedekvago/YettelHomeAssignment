//
//  Untitled.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import ApiClient
import Foundation
import OpenAPIURLSession

final class VignetteSelectionService: VignetteSelectionServiceProtocol {
    // This should be injected and url should come from somewhere else
    private let apiClient = Client(serverURL: URL(string: "http://localhost:8080")!, transport: URLSessionTransport())
    
    func fetchAvailableVignettes() async throws -> [Vignette] {
        let response = try? await apiClient.getHighwayInfo()
        switch response {
        case .ok(let okResponse):
            return okResponse.createDomainModel()
        default:
            throw DecodingError.dataCorrupted(
                .init(codingPath: [], debugDescription: "Missing vignette fields")
            )
        }
    }
    
    func fetchVehicle() async throws -> Vehicle {
        let response = try? await apiClient.getVehicleInfo()
        switch response {
        case .ok(let okResponse):
            return okResponse.createDomainModel()
        default:
            throw DecodingError.dataCorrupted(
                .init(codingPath: [], debugDescription: "Missing vehicle fields")
            )
        }
    }
}
