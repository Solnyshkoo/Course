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
    @State var lol: UserInfo = .init(name: "Ksenia", surname: "Perova", age: 18, nickname: "ksu", password: "123", sex: "none")
    var body: some Scene {
        WindowGroup {
            //MainView()
            TabBar(people: $lol)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
