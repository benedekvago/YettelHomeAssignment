//
//  YettelLabel.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

struct YettelLabel: View {
    let text: String
    var fontSize: CGFloat = 16
    var fontWeight: Font.Weight = .semibold
    var color: Color = ComponentColors.primaryColor
    var lineLimit: Int? = nil
    var multilineTextAlignment: TextAlignment = .leading

    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor(color)
            .lineLimit(lineLimit)
            .multilineTextAlignment(multilineTextAlignment)
    }
}

#Preview {
    YettelLabel(text: "Hello!")
}
