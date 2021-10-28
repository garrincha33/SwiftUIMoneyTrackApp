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
            //step 5 update enviroment to mainview
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
