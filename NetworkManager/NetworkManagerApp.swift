//
//  NetworkManagerApp.swift
//  NetworkManager
//
//  Created by Victor Sebastin on 2023-09-17.
//

import SwiftUI

@main
struct NetworkManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
