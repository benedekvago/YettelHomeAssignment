//
//  PurchaseConfirmationFlowCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

final class PurchaseConfirmationFlowCoordinator: PurchaseConfirmationFlowCoordinatorProtocol {
    func start() {}
}

// MARK: FlowProtocol
extension PurchaseConfirmationFlowCoordinator {
    func getFirstView() -> some View {
        ConfirmationView()
    }
}
