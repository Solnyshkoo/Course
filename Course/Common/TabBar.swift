//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct TabBar: View {
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
            PersonalView()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Personal")
                }
        }
    }
}

struct TabBar_Preview: PreviewProvider {
    static var previews: some View {
        TabBar().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
