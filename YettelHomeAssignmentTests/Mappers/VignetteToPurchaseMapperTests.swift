//
//  VignetteToPurchaseMapperTests.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 09..
//

import XCTest
@testable import YettelHomeAssignment

final class VignetteToPurchaseMapperTests: XCTestCase {
    func testMappingWhenVignettesAreEmpty() {
        // Given
        let vehicle = Vehicle(owner: "Some Name", plate: "ABC-123", type: .car)
        let vignettes: [Vignette] = []

        // When
        let (purchaseInfo, purchaseItems) = VignetteToPurchaseMapper.map(vehicle: vehicle, vignettes: vignettes)

        // Then
        XCTAssertTrue(purchaseInfo.isEmpty)
        XCTAssertTrue(purchaseItems.isEmpty)
    }

    func testMappingWithOneVignette() {
        // Given
        let vehicle = Vehicle(owner: "Some Name", plate: "ABC-123", type: .car)
        let vignette = Vignette(
            name: "Annual Vignette",
            price: 1500,
            type: .country(.year)
        )
        let vignettes = [vignette]

        // When
        let (purchaseInfo, purchaseItems) = VignetteToPurchaseMapper.map(vehicle: vehicle, vignettes: vignettes)

        // Then
        XCTAssertEqual(purchaseInfo.count, 2)
        XCTAssertEqual(purchaseInfo[0].title, Localizable.plate)
        XCTAssertEqual(purchaseInfo[0].detail, vehicle.plate)
        XCTAssertEqual(purchaseInfo[1].title, Localizable.vignetteType)
        XCTAssertEqual(purchaseInfo[1].detail, Localizable.countryVignette)

        XCTAssertEqual(purchaseItems.count, 1)
        XCTAssertEqual(purchaseItems[0].name, vignette.name)
        XCTAssertEqual(purchaseItems[0].price, vignette.price)
    }

    func testMappingWithMultipleVignettes() {
        // Given
        let vehicle = Vehicle(owner: "Some Name", plate: "ABC-123", type: .car)
        let countryVignette = Vignette(name: "Country", price: 2000, type: .country(.year))
        let shireVignette = Vignette(name: "Shire", price: 500, type: .shire(.baranya))
        let vignettes = [countryVignette, shireVignette]

        // When
        let (purchaseInfo, purchaseItems) = VignetteToPurchaseMapper.map(vehicle: vehicle, vignettes: vignettes)

        // Then
        // purchaseInfo always uses first vignette type
        XCTAssertEqual(purchaseInfo.count, 2)
        XCTAssertEqual(purchaseInfo[1].detail, Localizable.countryVignette)

        XCTAssertEqual(purchaseItems.count, 2)
        XCTAssertEqual(purchaseItems[0].name, countryVignette.name)
        XCTAssertEqual(purchaseItems[0].price, countryVignette.price)
        XCTAssertEqual(purchaseItems[1].name, shireVignette.name)
        XCTAssertEqual(purchaseItems[1].price, shireVignette.price)
    }
}
