//
//  SuccessfulPurchaseView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import SwiftUI
import UIComponents

struct SuccessfulPurchaseView: View {
    var body: some View {
        VStack {
            Spacer()
            YettelLabel(text: "A matricákat sikeresen kifizetted!")
            Spacer()
            YettelButton(title: "Rendben", style: .primary) {
                
            }
        }
        .background(.green)
    }
}

#Preview {
    SuccessfulPurchaseView()
}
