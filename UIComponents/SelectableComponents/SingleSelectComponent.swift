//
//  SingleSelectComponent.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

public struct SingleSelectComponent: View {
    let isSelected: Bool
    let title: String
    let additionalInfo: String
    
    public init(isSelected: Bool, title: String, additionalInfo: String) {
        self.isSelected = isSelected
        self.title = title
        self.additionalInfo = additionalInfo
    }
    
    public var body: some View {
        YettelCard {
            HStack {
                RadioButton(isSelected: isSelected)
                YettelLabel(text: title)
                Spacer()
                YettelLabel(text: additionalInfo)
            }
        }
        .overlay {
            let borderColor = isSelected ? ComponentColors.primaryColor : ComponentColors.secondaryColor
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(borderColor, lineWidth: Constants.borderWidth)
        }
    }
}

private extension SingleSelectComponent {
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let borderWidth: CGFloat = 2
    }
}
