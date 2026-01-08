//
//  ShireVignetteSelectionView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import UIComponents
import SwiftUI

struct ShireVignetteSelectionView: View {
    var body: some View {
        VStack(spacing: 0) {
            YettelHeader()
            ScrollView {
                VStack {
                    YettelLabel(text: "Éves vármegyei matricák")
                    Separator()
                    YettelLabel(text: "Fizetendő össezeg")
                    YettelLabel(text: "21 800 Ft")
                    YettelButton(title: "Vásárlás", style: .primary) {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ShireVignetteSelectionView()
}
