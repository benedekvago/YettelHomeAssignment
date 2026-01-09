//
//  RadioButton.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

struct RadioButton: View {
    var isSelected: Bool
    var size: CGFloat = 28
    var borderWidth: CGFloat = 2
    var selectedColor: Color = ComponentColors.primaryColor
    var backgroundColor: Color = .clear
    var borderColor: Color = ComponentColors.secondaryColor
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(borderColor, lineWidth: borderWidth)
                .background(
                    Circle()
                        .fill(backgroundColor)
                )
                .frame(width: size, height: size)
            
            if isSelected {
                Circle()
                    .fill(selectedColor)
                    .frame(width: 16, height: 16)
            }
        }
    }
}
