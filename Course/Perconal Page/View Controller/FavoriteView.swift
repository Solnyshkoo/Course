import Foundation

import SwiftUI

struct FavoriteView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var people: UserInfo
    @ObservedObject private var eventsViewMode = EventsViewModel()

    @State private var searchText = ""
    @State private var isSearching = false
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                ForEach((people.favorities).filter { "\($0.shortTitle)".contains(searchText.lowercased()) || searchText.isEmpty }) { item in
                    EventCell(event: item, people: $people)
                }
            }
            .navigationTitle("Events")
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigation) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(ColorPalette.navigationBarItem)
                        .onTapGesture {
                            self.mode.wrappedValue.dismiss()
                        }
                }
            })
            Spacer()
        }
    }
}
