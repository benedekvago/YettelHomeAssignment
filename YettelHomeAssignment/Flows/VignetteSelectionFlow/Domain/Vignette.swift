//
//  Vignette.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Foundation

struct Vignette {
    enum VignetteType {
        case country
        case shire
    }
    let name: String
    let price: Decimal
    let type: VignetteType
}
