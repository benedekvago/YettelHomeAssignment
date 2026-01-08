//
//  FlowProtocol.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI

protocol FlowProtocol {
    associatedtype Content: View
    func getFirstView() -> Content
}

