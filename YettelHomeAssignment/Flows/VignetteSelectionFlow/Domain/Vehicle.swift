//
//  Vehicle.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

struct Vehicle {
    enum VehicleType {
        case car
        case unknown
    }

    let owner: String
    let plate: String
    let type: VehicleType
}
