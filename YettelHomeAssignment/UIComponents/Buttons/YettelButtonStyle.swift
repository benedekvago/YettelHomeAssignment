//
//  YettelButtonStyle.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

struct YettelButtonStyle: ButtonStyle {
    enum Style {
        case primary
        case secondary

        fileprivate func configuration() -> ButtonConfiguration {
            switch self {
            case .primary:
                return ButtonConfiguration(
                    background: ComponentColors.primaryColor,
                    borderColor: nil,
                    textColor: ComponentColors.backgroundColor
                )
            case .secondary:
                return ButtonConfiguration(
                    background: ComponentColors.backgroundColor,
                    borderColor: ComponentColors.primaryColor,
                    textColor: ComponentColors.primaryColor
                )
            }
        }
    }
    
    fileprivate struct ButtonConfiguration {
        let background: Color
        let borderColor: Color?
        let textColor: Color
    }
    
    let buttonStyle: Style
    
    func makeBody(configuration: Configuration) -> some View {
        let buttonConfiguration = buttonStyle.configuration()
        return configuration.label
            .foregroundStyle(buttonConfiguration.textColor)
            .background(buttonConfiguration.background)
            .overlay {
                if let borderColor = buttonConfiguration.borderColor {
                    Capsule().stroke(borderColor, lineWidth: 2)
                }
            }
    }
}

extension View {
    func yettelButtonStyle(_ style: YettelButtonStyle.Style) -> some View {
        self.buttonStyle(YettelButtonStyle(buttonStyle: style))
    }
}
