//
//  ComponentColors.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

public enum ComponentColors {
    private static let bundle = Bundle(for: BundleToken.self)

    public static let primaryColor = Color("darkBlueColor", bundle: bundle)
    public static let secondaryColor = Color("somethingElse", bundle: bundle)
    public static let darkGray = Color("something", bundle: bundle)
    public static let backgroundColor = Color("asdas", bundle: bundle)
    public static let secondaryBackgroundColor = Color("lightGreenColor", bundle: bundle)
}
