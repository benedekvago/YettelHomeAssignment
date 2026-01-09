//
//  Checkbox.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

public struct Checkbox: View {
    var isSelected: Bool
    var size: CGFloat
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    var selectedColor: Color
    var unselectedColor: Color
    var borderColor: Color
    
    public init(
        isSelected: Bool,
        size: CGFloat = 20,
        borderWidth: CGFloat = 2,
        cornerRadius: CGFloat = 4,
        selectedColor: Color = ComponentColors.secondaryColor,
        unselectedColor: Color = .clear,
        borderColor: Color = ComponentColors.secondaryColor
    ) {
        self.isSelected = isSelected
        self.size = size
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.borderColor = borderColor
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(borderColor, lineWidth: borderWidth)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(isSelected ? selectedColor : unselectedColor)
                )
                .frame(width: size, height: size)

            if isSelected {
                ComponentIcons.checkIcon
                    .renderingMode(.template)
                    .foregroundColor(ComponentColors.darkGray)
                    .frame(width: 12, height: 12)
            }
        }
    }
}
