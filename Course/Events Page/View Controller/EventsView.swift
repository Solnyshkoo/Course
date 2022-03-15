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
                ForEach((eventsViewMode.info).filter { "\($0.shortTitle)".contains(searchText.lowercased()) || searchText.isEmpty }) { item in
                    EventCell(event: item, people: $people)
                }
            }
            .navigationTitle("Events")
        }
    }
}
