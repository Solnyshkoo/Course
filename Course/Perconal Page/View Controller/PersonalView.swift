//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct PersonalView: View {
    @Binding var people: UserInfo
    @State var showSetting = false
    var body: some View {
        VStack {
            VStack {
                Header(sex: people.sex)
                ProfileText(people: $people)
            }
            Spacer()
        }
    }
}
struct BindingViewExamplePreviewContainer_2: View {
    @State var lol: UserInfo = .init(name: "Ksenia", surname: "Perova", age: "18", nickname: "ksu", password: "123", sex: "female")

    var body: some View {
        PersonalView(people: $lol)
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        BindingViewExamplePreviewContainer_2()
    }
}
