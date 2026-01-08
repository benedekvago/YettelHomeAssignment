//
//  VignetteApiToDomainMapper.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import ApiClient

extension Operations.getHighwayInfo.Output.Ok {
    func createDomainModel() -> [Vignette] {
        // This function should be better
        let body = try! self.body.json
        var vignettes: [Vignette] = []
        let countryVignettes = body.payload!.highwayVignettes!
        for countryVignette in countryVignettes {
            // Fix this mapping
            let vignette = Vignette(name: countryVignette.vignetteType![0], price: 5450, type: .shire(.pest))
            vignettes.append(vignette)
        }
        let shireVignettes = body.payload!.counties!
        for shireVignette in shireVignettes {
            // Fix this mapping
            let vignette = Vignette(name: shireVignette.name!, price: 5450, type: .shire(.pest))
            vignettes.append(vignette)
        }
        return vignettes
    }
}
