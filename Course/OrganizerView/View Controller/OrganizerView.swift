import Foundation

import SwiftUI
struct OrganizerView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var showingAlert = false
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingAlert.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.vertical)
                            .padding(.top, 50)
                    }.alert("Not availeble now. See in next update :)", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }.padding(.horizontal, 30)

                SearchBar(searchText: $searchText, isSearching: $isSearching)
            }

            ScrollView {
                Spacer()
                Text("No events")
                    .font(.title2)
                Spacer()
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct OrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
