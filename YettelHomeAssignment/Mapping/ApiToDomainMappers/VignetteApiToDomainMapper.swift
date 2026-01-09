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
        // This function should be better
        let body = try! self.body.json
        var vignettes: [Vignette] = []
        let shireVignettes = body.payload!.counties!
        var countryVignettes = body.payload!.highwayVignettes!
        
        for shireVignette in shireVignettes {
            // Fix this mapping
            let vignette = Vignette(name: shireVignette.name!, price: Decimal(Double(countryVignettes.last!.cost!)), type: .shire(.pest))
            vignettes.append(vignette)
        }
        
        countryVignettes.removeLast()

        for countryVignette in countryVignettes {
            // Fix this mapping
            let vignette = Vignette(name: countryVignette.vignetteType![0], price: Decimal(Double(countryVignette.cost!)), type: .country(.day))
            vignettes.append(vignette)
        }
        
        return vignettes
    }
}
