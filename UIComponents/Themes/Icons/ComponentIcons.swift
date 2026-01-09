//
//  ComponentIcons.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

enum ComponentIcons {
    private static let bundle = Bundle(for: BundleToken.self)

    static let checkIcon = Image("checkIcon", bundle: bundle)
    static let rightArrowIcon = Image("rightArrowIcon", bundle: bundle)
    static let leftArrowIcon = Image("leftArrowIcon", bundle: bundle)
}
