//
//  VignetteApiToDomainMapper.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import ApiClient
import Foundation

extension Operations.getHighwayInfo.Output.Ok {
    func createDomainModel() -> [Vignette] {
        let body = try! self.body.json
        var vignettes: [Vignette] = []
        let shireVignettes = body.payload!.counties!
        var countryVignettes = body.payload!.highwayVignettes!
        
        for shireVignette in shireVignettes {
            let type: Vignette.VignetteType = switch shireVignette.name! {
            case "Bács-Kiskun":
                    .shire(.bacsKiskun)
            case "Baranya":
                    .shire(.baranya)
            case "Békés":
                    .shire(.bekes)
            case "Borsod-Abaúj-Zemplén":
                    .shire(.borsodAbaujZemplen)
            case "Csongrád":
                    .shire(.csongrád)
            case "Fejér":
                    .shire(.fejer)
            case "Győr-Moson-Sopron":
                    .shire(.gyorMosonSopron)
            case "Hajdú-Bihar":
                    .shire(.hajduBihar)
            case "Heves":
                    .shire(.heves)
            case "Jász-Nagykun-Szolnok":
                    .shire(.jaszNagykunSzolnok)
            case "Komárom-Esztergom":
                    .shire(.komaromEsztergom)
            case "Nógrád":
                    .shire(.nograd)
            case "Pest":
                    .shire(.pest)
            case "Somogy":
                    .shire(.somogy)
            case "Szabolcs-Szatmár-Bereg":
                    .shire(.szabolcsSzatmarBereg)
            case "Tolna":
                    .shire(.tolna)
            case "Vas":
                    .shire(.vas)
            case "Veszprém":
                    .shire(Vignette.ShireType.veszprém)
            case "Zala":
                    .shire(.zala)
            default:
                    .shire(.pest)
            }
            let vignette = Vignette(name: shireVignette.name!, price: Decimal(Double(countryVignettes.last!.cost!)), type: type)
            vignettes.append(vignette)
        }
        
        countryVignettes.removeLast()

        for countryVignette in countryVignettes {
            let type: Vignette.VignetteType = switch countryVignette.vignetteType![0] {
            case "DAY":
                .country(.day)
            case "MONTH":
                .country(.month)
            case "WEEK":
                .country(.week)
            case "YEAR":
                .country(.year)
            default:
                .country(.day)
            }
            let vignette = Vignette(name: countryVignette.vignetteType![0], price: Decimal(Double(countryVignette.cost!)), type: type)
            vignettes.append(vignette)
        }
        
        return vignettes
    }
}
