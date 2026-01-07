//
//  YettelHeader.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

struct YettelHeader: View {
    var body: some View {
        HStack {
            Image(uiImage: .checkmark)
                .renderingMode(.template)
            Text("E-matrica")
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

#Preview {
    YettelHeader()
}
