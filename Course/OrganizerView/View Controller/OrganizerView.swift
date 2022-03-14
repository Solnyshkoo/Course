//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct OrganizerView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.vertical)
                            .padding(.top, 50)
                    }
                }.padding(.horizontal, 30)
                
                SearchBar(searchText: $searchText, isSearching: $isSearching)
            }

            ScrollView {}
        }.edgesIgnoringSafeArea(.top)
    }
}

struct OrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
