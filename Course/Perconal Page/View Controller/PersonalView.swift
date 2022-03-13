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
