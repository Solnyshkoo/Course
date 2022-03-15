import SwiftUI

@main
struct CourseApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
