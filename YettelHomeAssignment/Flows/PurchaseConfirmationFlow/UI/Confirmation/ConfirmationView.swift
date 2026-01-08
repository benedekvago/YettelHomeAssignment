//
//  ConfirmationView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI
import UIComponents

struct ConfirmationView: View {
    var body: some View {
        VStack(spacing: 0) {
            YettelHeader()
            ScrollView {
                VStack {
                    YettelLabel(text: "Vásárlás megerősítése")
                    Separator()
                    Separator()
                    Separator()
                    YettelLabel(text: "Fizetendő össezeg")
                    YettelLabel(text: "21 910 Ft")
                    YettelButton(title: "Tovább", style: .primary) {
                        
                    }
                    YettelButton(title: "Mégsem", style: .secondary) {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ConfirmationView()
}
