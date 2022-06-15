//
//  FlipNotesApp.swift
//  Shared
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI

@main
struct FlipNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
