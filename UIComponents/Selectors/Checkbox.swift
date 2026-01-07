//
//  Checkbox.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

struct Checkbox: View {
    @Binding var isSelected: Bool

    var size: CGFloat = 20
    var borderWidth: CGFloat = 2
    var cornerRadius: CGFloat = 4
    var selectedColor: Color = ComponentColors.secondaryColor
    var unselectedColor: Color = .clear
    var borderColor: Color = ComponentColors.secondaryColor

    var body: some View {
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

#Preview {
    struct Preview: View {
        @State var isSelected = true
        var body: some View {
            Checkbox(isSelected: $isSelected)
        }
    }

    return Preview()
}
