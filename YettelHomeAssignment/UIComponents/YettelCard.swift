//
//  YettelCard.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

struct YettelCard<Content>: View where Content: View {
    let cornerRadius: CGFloat
    let content: Content
    
    init(cornerRadius: CGFloat = 8, @ViewBuilder content: () -> Content) {
        self.cornerRadius = cornerRadius
        self.content = content()
    }

    var body: some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 26)
            .frame(maxWidth: .infinity)
            .background(ComponentColors.backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    YettelCard {
        Text("asd")
    }
}
