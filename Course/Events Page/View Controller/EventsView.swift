//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct EventsView: View {
    @StateObject private var eventsViewMode = EventsViewModel()
    @State private var searchText = ""
    @State private var isSearching = false
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                ForEach((0 ..< 20).filter { "\($0)".contains(searchText) || searchText.isEmpty },
                        id: \.self) { num in
                    HStack {
                        Text("\(num)")
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
            }
            .navigationTitle("Events")
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
