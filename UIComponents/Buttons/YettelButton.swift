//
//  YettelButton.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 06..
//

import SwiftUI

public struct YettelButton: View {
    let title: String
    let style: YettelButtonStyle.Style
    let action: () -> Void
    
    public init(title: String, style: YettelButtonStyle.Style, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        Button (action: action) {
            Text(title)
                .padding(16)
                .frame(maxWidth: .infinity)
                .font(.system(size: 16))
                .fontWeight(.semibold)
        }
        .yettelButtonStyle(style)
        .clipShape(Capsule())
    }
}

#Preview {
    YettelButton(title: "Vásárlás", style: .secondary) {
        
    }
}
