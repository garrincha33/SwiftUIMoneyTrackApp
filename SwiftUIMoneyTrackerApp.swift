//
//  SwiftUIMoneyTrackerApp.swift
//  SwiftUIMoneyTracker
//
//  Created by Richard Price on 24/10/2021.
//

import SwiftUI

@main
struct SwiftUIMoneyTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
