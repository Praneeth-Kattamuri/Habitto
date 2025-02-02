//
//  habittoApp.swift
//  habitto
//
//  Created by K Praneeth on 2/1/25.
//

import SwiftUI

@main
struct habittoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
