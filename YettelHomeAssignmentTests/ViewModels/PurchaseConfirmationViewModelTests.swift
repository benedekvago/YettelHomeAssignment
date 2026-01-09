//
//  PurchaseConfirmationViewModelTests.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 09..
//

import XCTest
import SwiftUI
@testable import YettelHomeAssignment

final class MockPurchaseConfirmationCoordinator: PurchaseConfirmationFlowCoordinatorProtocol {
    typealias Content = EmptyView

    var startCalled = false
    var pushSuccessViewCalled = false
    var popViewCalled = false
    var finishFlowCalled = false

    // MARK: - PurchaseConfirmationFlowCoordinatorProtocol
    func start(
        purchaseInfo: [PurchaseInfo],
        purchaseItems: [PurchaseItem],
        purchaseConfirmationService: PurchaseConfirmationServiceProtocol,
        parentCoordinator: PurchaseConfirmationParentCoordinatorProtocol
    ) {
        startCalled = true
    }

    func pushSuccessView() {
        pushSuccessViewCalled = true
    }

    func popView() {
        popViewCalled = true
    }

    func finishFlow() {
        finishFlowCalled = true
    }

    // MARK: - FlowProtocol
    func getFirstView() -> EmptyView {
        return EmptyView()
    }
}

final class MockPurchaseConfirmationService: PurchaseConfirmationServiceProtocol {
    var confirmPurchaseCalled = false
    
    func confirmPurchase() async throws {
        confirmPurchaseCalled = true
    }
}

final class PurchaseConfirmationFlowViewModelTests: XCTestCase {

    var viewModel: PurchaseConfirmationFlowViewModel!
    var mockService: MockPurchaseConfirmationService!
    var mockCoordinator: MockPurchaseConfirmationCoordinator!

    override func setUp() {
        super.setUp()
        mockService = MockPurchaseConfirmationService()
        mockCoordinator = MockPurchaseConfirmationCoordinator()
        viewModel = PurchaseConfirmationFlowViewModel(
            purchaseInfo: [],
            purchaseItems: [PurchaseItem(name: "Test Item", price: 100)],
            purchaseConfirmationService: mockService,
            coordinator: mockCoordinator
        )
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testConfirmPurchaseCallsCoordinatorPushSuccess() {
        viewModel.confirmPurchase()
        XCTAssertTrue(mockCoordinator.pushSuccessViewCalled)
    }

    func testOnOkTappedCallsServiceAndCoordinatorFinishFlow() async {
        await viewModel.onOkTapped()
        XCTAssertTrue(mockService.confirmPurchaseCalled)
        XCTAssertTrue(mockCoordinator.finishFlowCalled)
    }
}
