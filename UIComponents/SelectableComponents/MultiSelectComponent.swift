//
//  MultiSelectComponent.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

public struct MultiSelectComponent: View {
    let isSelected: Bool
    let title: String
    let additionalInfo: String
    
    public init(isSelected: Bool, title: String, additionalInfo: String) {
        self.isSelected = isSelected
        self.title = title
        self.additionalInfo = additionalInfo
    }

    public var body: some View {
        HStack {
            Checkbox(isSelected: isSelected)
            YettelLabel(text: title, fontWeight: .light, color: isSelected ? ComponentColors.darkGray :  ComponentColors.primaryColor)
            Spacer()
            YettelLabel(text: additionalInfo, fontWeight: .bold)
        }
    }
}
