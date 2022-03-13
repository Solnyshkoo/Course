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
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }
            EventsView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Second Tab")
                }
            PersonalView(people: $people)
                .tabItem {
                    Image(systemName: "circle")
                    Text("Personal")
                }
        }
    }
}

