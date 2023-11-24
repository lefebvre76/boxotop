//
//  BoxotopApp.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import SwiftUI
import SwiftData

@main
struct BoxotopApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Feedback.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MoviesView()
        }
        .modelContainer(sharedModelContainer)
    }
}
