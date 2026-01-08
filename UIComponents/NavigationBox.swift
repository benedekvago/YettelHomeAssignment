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
        YettelCard(cornerRadius: 16) {
            HStack {
                YettelLabel(text: title)
                Spacer()
                ComponentIcons.rightArrowIcon
                    .renderingMode(.template)
                    .foregroundColor(ComponentColors.primaryColor)
                    .frame(width: 12, height: 12)
            }
        }
    }
}

#Preview {
    NavigationBox(title: "Éves vármegyei matricák")
        .background(Color.blue)
}
