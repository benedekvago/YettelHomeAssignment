//
//  NavigationBox.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI

public struct NavigationBox: View {
    let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        YettelCard(cornerRadius: Constants.cornerRadius) {
            HStack {
                YettelLabel(text: title)
                Spacer()
                ComponentIcons.rightArrowIcon
                    .renderingMode(.template)
                    .foregroundColor(ComponentColors.primaryColor)
                    .frame(width: Constants.iconSize, height: Constants.iconSize)
            }
        }
    }
}

private extension NavigationBox {
    enum Constants {
        static let cornerRadius: CGFloat = 16
        static let iconSize: CGFloat = 12
    }
}
