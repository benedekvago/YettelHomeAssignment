//
//  Separator.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

struct Separator: View {
    var body: some View {
        Rectangle()
            .fill(ComponentColors.secondaryColor)
            .frame(height: 1)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    Separator()
}
