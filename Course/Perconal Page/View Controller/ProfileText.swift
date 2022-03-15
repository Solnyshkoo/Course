//
//  ProfileText.swift
//  Course
//
//  Created by Ksenia Petrova on 13.03.2022.
//

import Foundation
import SwiftUI
struct ProfileText: View {
    @Binding var people: UserInfo
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text("\(people.name) \(people.surname), \(people.age) age")
                    .bold()
                    .font(.title)
                Text(people.nickname)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
        }
    }
}
