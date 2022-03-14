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
    @State private var selectedIndex = 0
    var body: some View {
        VStack {
            VStack {
                Header(sex: people.sex)
                ProfileText(people: $people)
                Picker("Favorite Color", selection: $selectedIndex, content: {
                                Text("History").tag(0)
                                Text("My events").tag(1)
                            })
                .pickerStyle(SegmentedPickerStyle())
                
                // TODO сделать норм
                if selectedIndex == 1 {
                    Circle().foregroundColor(Color.red)
                } else {
                    Circle().foregroundColor(Color.blue)
                }
            }
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
