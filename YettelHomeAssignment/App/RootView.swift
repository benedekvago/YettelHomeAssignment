//
//  RootView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import SwiftUI
import ApiClient
import OpenAPIURLSession

struct RootView: View {
    // Should be injected
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            EmptyView()
                .navigationDestination(for: AnyFlowRoute.self) { route in
                    route.view()
                        .toolbar(.hidden, for: .navigationBar)
                }
        }
        .onAppear {
            coordinator.start()
        }
    }
}

#Preview {
    RootView()
}
