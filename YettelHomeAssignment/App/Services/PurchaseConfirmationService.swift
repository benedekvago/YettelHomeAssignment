//
//  PurchaseConfirmationService.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import ApiClient
import Foundation
import OpenAPIURLSession

final class PurchaseConfirmationService: PurchaseConfirmationServiceProtocol {
    // This should be injected and url should come from somewhere else
    private let apiClient = Client(serverURL: URL(string: "http://localhost:8080")!, transport: URLSessionTransport())
    
    func confirmPurchase() async throws {
        let order1 = Operations.postHighwayOrder.Input.Body.jsonPayload.highwayOrdersPayloadPayload(
            _type: "10-day",
            category: "A",
            cost: 10.0
        )
        let payload = Operations.postHighwayOrder.Input.Body.jsonPayload(
            highwayOrders: [order1]
        )
        let body = Operations.postHighwayOrder.Input.Body.json(payload)
        try! await apiClient.postHighwayOrder(body: body)
    }
}
