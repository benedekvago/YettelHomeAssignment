//
//  VignetteSelectionFlowCoordinator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

final class VignetteSelectionFlowCoordinator: VignetteSelectionFlowCoordinatorProtocol {
    func start() {}
}

// MARK: FlowProtocol
extension VignetteSelectionFlowCoordinator {
    func getFirstView() -> some View {
        CountryVignetteSelectionView()
    }
}
