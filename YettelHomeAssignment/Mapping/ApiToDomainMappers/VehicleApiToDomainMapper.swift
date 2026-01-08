//
//  VehicleApiToDomainMapper.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import ApiClient

extension Operations.getVehicleInfo.Output.Ok {
    func createDomainModel() -> Vehicle {
        // This function should be better
        let body = try! self.body.json

        let name = body.name!
        let plate = body.plate!
        let type = if body._type == "CAR" {
            Vehicle.VehicleType.car
        } else {
            Vehicle.VehicleType.car
        }
        return Vehicle(owner: name, plate: plate, type: type)
    }
}
