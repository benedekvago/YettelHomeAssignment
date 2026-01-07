//
//  SingleSelectComponent.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

struct SingleSelectComponent: View {
    @Binding var isSelected: Bool
    let title: String
    let additionalInfo: String
    var body: some View {
        YettelCard {
            HStack {
                RadioButton(isSelected: $isSelected)
                YettelLabel(text: title)
                Spacer()
                YettelLabel(text: additionalInfo)
            }
        }
        .overlay {
            let borderColor = isSelected ? ComponentColors.primaryColor : ComponentColors.secondaryColor
            RoundedRectangle(cornerRadius: 8)
                                .stroke(borderColor, lineWidth: 2)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var isSelected = true
        var body: some View {
            SingleSelectComponent(
                isSelected: $isSelected,
                title: "Baranya",
                additionalInfo: "5450 Ft"
            )
        }
    }

    return Preview()
}
