//
//  MultiSelectComponent.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

struct MultiSelectComponent: View {
    @Binding var isSelected: Bool
    let title: String
    let additionalInfo: String

    var body: some View {
        HStack {
            Checkbox(isSelected: $isSelected)
            YettelLabel(text: title, color: isSelected ? ComponentColors.darkGray :  ComponentColors.primaryColor)
            Spacer()
            YettelLabel(text: additionalInfo)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var isSelected = true
        var body: some View {
            MultiSelectComponent(
                isSelected: $isSelected,
                title: "Baranya",
                additionalInfo: "5450 Ft"
            )
        }
    }

    return Preview()
}
