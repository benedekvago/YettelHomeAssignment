//
//  VignetteSelectionFlowViewModel.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Combine
import Foundation

class VignetteSelectionFlowViewModel: ObservableObject {
    private let vignetteSelectionService: VignetteSelectionServiceProtocol
    // Should be a different protocol
    private let coordinator: any VignetteSelectionFlowCoordinatorProtocol
    
    @Published var vehicle: Vehicle?
    
    var countryVignettes: [Vignette]? {
        guard let vignettes else { return nil }
        return vignettes.filter { vignette in
            switch vignette.type {
            case .country:
                return true
            default:
                return false
            }
        }
    }
    
    @Published var selectedCountryVignette: Vignette?
    
    var shireVignettes: [Vignette]? {
        guard let vignettes else { return nil }
        return vignettes.filter { vignette in
            switch vignette.type {
            case .shire:
                return true
            default:
                return false
            }
        }
    }
    
    @Published var selectedShireVignettes: [Vignette] = []
    
    private var vignettes: [Vignette]? {
        didSet {
            objectWillChange.send()
        }
    }
    
    var shireVignettesPrice: Decimal {
        selectedShireVignettes.reduce(0) { $0 + $1.price }
    }
    
    init(vignetteSelectionService: VignetteSelectionServiceProtocol, coordinator: any VignetteSelectionFlowCoordinatorProtocol) {
        self.vignetteSelectionService = vignetteSelectionService
        self.coordinator = coordinator
    }
    
    func didSelectContryVignette(vignette: Vignette) {
        selectedCountryVignette = vignette
    }
    
    func didTapShireVignette(vignette: Vignette) {
        if let index = selectedShireVignettes.firstIndex(of: vignette) {
            selectedShireVignettes.remove(at: index)
        } else {
            selectedShireVignettes.append(vignette)
        }
    }
    
    func loadVignettes() async {
        let vehicle = try? await vignetteSelectionService.fetchVehicle()
        let vignettes = try? await vignetteSelectionService.fetchAvailableVignettes()
        await MainActor.run {
            self.vehicle = vehicle
            self.vignettes = vignettes
            if selectedCountryVignette == nil {
                self.selectedCountryVignette = countryVignettes?.first
            }
        }
    }
    
    func openShireView() {
        coordinator.pushShireView()
    }
    
    func startCountryPurcahseConfirmationFlow() {
        guard let vehicle, let selectedCountryVignette else { return }
        coordinator.startPurcahseConfirmationFlow(vehicle: vehicle, vignettes: [selectedCountryVignette])
    }
    
    func startShirePurcahseConfirmationFlow() {
        guard let vehicle, !selectedShireVignettes.isEmpty else { return }
        coordinator.startPurcahseConfirmationFlow(vehicle: vehicle, vignettes: selectedShireVignettes)
    }
    
    func popView() {
        coordinator.popView()
    }
}
