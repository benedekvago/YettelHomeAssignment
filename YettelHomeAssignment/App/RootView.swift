//
//  RootView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 07..
//

import Factory
import SwiftUI
import ApiClient
import OpenAPIURLSession

struct RootView: View {
    // Should be injected
    @StateObject private var coordinator = Container.shared.appCoordinator()
    
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
