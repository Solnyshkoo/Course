import SwiftUI

@main
struct CourseApp: App {
    let persistenceController = PersistenceController.shared
    @State var lol: UserInfo = .init(name: "Ksenia", surname: "Perova", age: 18, nickname: "ksu", password: "123", sex: "female")
    var body: some Scene {
        WindowGroup {
            MainView(man: lol)
        }
    }
}
