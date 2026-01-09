//
//  Localizable.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 09..
//

enum Localizable {
    static let headerTitle = String(localized: "header_title")
    static let cancel = String(localized: "cancel")
    static let next = String(localized: "next")
    static let confirmPurcahse = String(localized: "confirm_purchase")
    static let sumToPay = String(localized: "sum_to_pay")
    static let serviceFee = String(localized: "service_fee")
    static let successfulPayment = String(localized: "successful_payment")
    static let ok = String(localized: "ok")
    static let countryVignettes = String(localized: "country_vignettes")
    static let shireVignettes = String(localized: "shire_vignettes")
    static let pay = String(localized: "pay")
    static let countryVignetteDay = String(localized: "country_vignette_day")
    static let countryVignetteWeek = String(localized: "country_vignette_week")
    static let countryVignetteMonth = String(localized: "country_vignette_month")
    static let countryVignetteYear = String(localized: "country_vignette_year")
    
    static func price(_ amount: String) -> String {
        let format = String(localized: "price_format")
        return String(format: format, amount)
    }
}
