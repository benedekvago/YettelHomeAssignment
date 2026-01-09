//
//  ParentFlowProtocol.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

protocol ParentFlowProtocol {
    func pushView(view: some View)
    func popView()
    func popToRoot()
}
