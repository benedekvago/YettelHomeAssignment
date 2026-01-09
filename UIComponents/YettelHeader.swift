//
//  YettelHeader.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

public struct YettelHeader: View {
    
    let action: () -> Void
    let title: String

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        HStack {
            ComponentIcons.leftArrowIcon
                .renderingMode(.template)
                .frame(width: Constants.iconSize, height: Constants.iconSize)
                .onTapGesture {
                    action()
                }
            YettelLabel(text: title, fontWeight: .bold)
        }
        .padding(.leading, Constants.largePadding)
        .foregroundStyle(ComponentColors.primaryColor)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, Constants.normalPadding)
        .padding(.top, Constants.largePadding)
        .background(ComponentColors.secondaryBackgroundColor)
        .clipShape(
            UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: Constants.topCornerRadius,
                    bottomLeading: Constants.bottomCornerRadius,
                    bottomTrailing: Constants.bottomCornerRadius,
                    topTrailing: Constants.topCornerRadius
                )
            )
        )
    }
}

private extension YettelHeader {
    enum Constants {
        static let iconSize: CGFloat = 24
        static let topCornerRadius: CGFloat = 0
        static let bottomCornerRadius: CGFloat = 20
        static let normalPadding: CGFloat = 16
        static let largePadding: CGFloat = 24
    }
}
