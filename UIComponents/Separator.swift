//
//  Separator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

public struct Separator: View {
    public init() {
        /* no-op */
    }
    public var body: some View {
        Rectangle()
            .fill(ComponentColors.secondaryColor)
            .frame(height: Constants.separatorHeight)
            .frame(maxWidth: .infinity)
    }
}

private extension Separator {
    enum Constants {
        static let separatorHeight: CGFloat = 1
    }
}
