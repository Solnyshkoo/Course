//
//  SearchBar.swift
//  Course
//
//  Created by Ksenia Petrova on 14.03.2022.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.leading, 32)
            }.padding(13)
                .background(Color(.systemGray5).opacity(0.75))
                .cornerRadius(15)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    isSearching = true
                })
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        if isSearching {
                            Button(action: { searchText = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            }
                        }
                    }.padding(.horizontal, 32)
                        .foregroundColor(.gray)
                ).transition(.move(edge: .trailing))
                .animation(.spring())

            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                }
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}

struct SearchBarPreviewContainer_2: View {
    @State var lol = ""
    @State var lol2 = false
    var body: some View {
        SearchBar(searchText: $lol, isSearching: $lol2)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarPreviewContainer_2()
    }
}

