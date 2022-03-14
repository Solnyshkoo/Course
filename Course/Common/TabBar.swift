//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct TabBar: View {
    @Binding var people: UserInfo
    var body: some View {
        TabView {
            OrganizerView()
                .tabItem {
                    Image("myEvents")
                }
            EventsView()
                .tabItem {
                    Image("all")
                }
            PersonalView(people: $people)
                .tabItem {
                    Image("person")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
        }
    }
}

