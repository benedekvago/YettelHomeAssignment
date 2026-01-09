//
//  Vignette.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import Foundation

struct Vignette: Hashable {
    enum CountryType: Hashable {
        case day
        case week
        case month
        case year
    }
    
    enum ShireType: Hashable {
        case bacsKiskun
        case baranya
        case bekes
        case borsodAbaujZemplen
        case csongrád
        case fejer
        case gyorMosonSopron
        case hajduBihar
        case heves
        case jaszNagykunSzolnok
        case komaromEsztergom
        case nograd
        case pest
        case somogy
        case szabolcsSzatmarBereg
        case tolna
        case vas
        case veszprém
        case zala
    }
    
    enum VignetteType: Hashable {
        case country(CountryType)
        case shire(ShireType)
    }
    
    let name: String
    let price: Decimal
    let type: VignetteType
}
