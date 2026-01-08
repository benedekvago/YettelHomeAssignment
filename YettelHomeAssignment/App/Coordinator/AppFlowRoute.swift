//
//  AppFlowRoute.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

struct AnyFlowRoute: Hashable {
    let id = UUID()
    let view: () -> AnyView

    static func == (lhs: AnyFlowRoute, rhs: AnyFlowRoute) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
