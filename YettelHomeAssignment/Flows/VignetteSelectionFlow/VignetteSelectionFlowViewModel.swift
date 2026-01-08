//
//  VignetteSelectionFlowViewModel.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Combine

class VignetteSelectionFlowViewModel: ObservableObject {
    private let vignetteSelectionService: VignetteSelectionServiceProtocol
    // Should be a different protocol
    private let coordinator: any VignetteSelectionFlowCoordinatorProtocol
    
    private var vehicle: Vehicle? {
        didSet {
            // .receiveOn should be used here somehow
            objectWillChange.send()
        }
    }
    
    var ownerName: String {
        vehicle?.owner ?? ""
    }

    var plate: String {
        vehicle?.plate ?? ""
    }
    
    init(vignetteSelectionService: VignetteSelectionServiceProtocol, coordinator: any VignetteSelectionFlowCoordinatorProtocol) {
        self.vignetteSelectionService = vignetteSelectionService
        self.coordinator = coordinator
    }
    
    func loadVignettes() async {
        let vehicle = try? await vignetteSelectionService.fetchVehicle()
        self.vehicle = vehicle
    }
    
    func openShireView() {
        coordinator.pushShireView()
    }
}
