//
//  VignetteToConfirmationMapper.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

final class VignetteToPurchaseMapper {
    static func map(vehicle: Vehicle, vignettes: [Vignette]) -> ([PurchaseInfo], [PurchaseItem]) {
        guard let firstVignette = vignettes.first else {
            return ([], [])
        }
        
        let purchaseInfo = [
            PurchaseInfo(title: "Rendszám", detail: vehicle.plate),
            PurchaseInfo(title: "Matrica típusa", detail: firstVignette.type.title)
        ]
        
        let purchaseItems = vignettes.map { vignette in
            PurchaseItem(name: vignette.name, price: vignette.price)
        }
        return (purchaseInfo, purchaseItems)
    }
}

extension Vignette.VignetteType {
    var title: String {
        switch self {
            case .country:
            return "Országos matrica"
        case .shire:
            return "Éves vármegyei"
        }
    }
}
