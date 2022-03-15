//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI

struct EventsView: View {
    @Binding var people: UserInfo
    @State private var elements = [EventsModel]()
    @ObservedObject private var eventsViewMode = EventsViewModel()
   
    @State private var searchText = ""
    @State private var isSearching = false
    var body: some View {
        NavigationView {
           ScrollView {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                ForEach(eventsViewMode.info) { item in

                    EventCell(event: item, people: $people)
                }
            
           }
            .navigationTitle("Events")
        }
    }
}


//struct EventsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
