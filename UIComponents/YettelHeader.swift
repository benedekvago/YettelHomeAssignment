//
//  YettelHeader.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

public struct YettelHeader: View {
    
    let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        HStack {
            ComponentIcons.leftArrowIcon
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .onTapGesture {
                    action()
                }
            YettelLabel(text: "E-matrica", fontWeight: .bold)
        }
        .padding(.leading, 24)
        .foregroundStyle(ComponentColors.primaryColor)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 16)
        .padding(.top, 24)
        .background(ComponentColors.secondaryBackgroundColor)
        .clipShape(
            UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: 0,
                    bottomLeading: 20,
                    bottomTrailing: 20,
                    topTrailing: 0
                )
            )
        )
    }
}
