//
//  YettelLabel.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

public struct YettelLabel: View {
    let text: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var color: Color
    var lineLimit: Int?
    var multilineTextAlignment: TextAlignment
    
    public init(
        text: String,
        fontSize: CGFloat = 16,
        fontWeight: Font.Weight = .semibold,
        color: Color = ComponentColors.primaryColor,
        lineLimit: Int? = nil,
        multilineTextAlignment: TextAlignment = .leading
    ) {
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.color = color
        self.lineLimit = lineLimit
        self.multilineTextAlignment = multilineTextAlignment
    }

    public var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor(color)
            .lineLimit(lineLimit)
            .multilineTextAlignment(multilineTextAlignment)
    }
}
