//
//  CountryVignetteSelectionView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 08..
//

import UIComponents
import SwiftUI

struct CountryVignetteSelectionView: View {
    
    // This could be a protocol for this view
    @ObservedObject var viewModel: VignetteSelectionFlowViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            YettelHeader()
            ScrollView {
                VStack {
                    YettelCard {
                        HStack {
                            Image(uiImage: .actions)
                            VStack {
                                Text(viewModel.plate)
                                Text(viewModel.ownerName)
                            }
                        }
                    }
                    YettelCard {
                        VStack {
                            YettelLabel(text: "Országos matricák")
                            YettelButton(title: "Vásárlás", style: .primary) {
                                
                            }
                        }
                    }
                    NavigationBox(title: "Éves vármegyei matricák")
                        .onTapGesture {
                            viewModel.openShireView()
                        }
                }
            }
        }
        .background(.gray)
        .onAppear {
            Task {
                await viewModel.loadVignettes()
            }
        }
    }
}
