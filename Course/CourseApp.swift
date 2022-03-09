//
//  CourseApp.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import SwiftUI

@main
struct CourseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
