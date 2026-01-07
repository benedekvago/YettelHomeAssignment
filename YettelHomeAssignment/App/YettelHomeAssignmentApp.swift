//
//  YettelHomeAssignmentApp.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 05..
//

import SwiftUI

@main
struct YettelHomeAssignmentApp: App {
    init() {
        AppContainer.register()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
