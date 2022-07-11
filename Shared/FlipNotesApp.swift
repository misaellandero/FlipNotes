//
//  FlipNotesApp.swift
//  Shared
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI

// MARK: - Navigation Options
enum SectionSelected {
    case questions, tags, categories, settings, cards
}


@main
struct FlipNotesApp: App {
    //Coreda Data
    @StateObject var coreData = PersistentCloudKitContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreData.persistentContainer.viewContext)
        }
    }
}
