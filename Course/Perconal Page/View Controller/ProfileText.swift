import Foundation
import SwiftUI
struct ProfileText: View {
    @Binding var people: UserInfo
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text("\(people.name) \(people.surname)" + (people.age == -1 ? "" : ", \(people.age) age"))
                    .bold()
                    .font(.title)
                Text(people.nickname)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
        }
    }
}
