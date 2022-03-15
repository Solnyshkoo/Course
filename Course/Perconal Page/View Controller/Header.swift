//
//  Header.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import SwiftUI

struct Header: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
 
    @Binding var people: UserInfo
    @State private var showSettings = false
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue / 255, green: gValue / 255, blue: bValue / 255))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: { self.showSettings.toggle() }) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 25, height: 25)
                                .padding(.vertical)
                        }.edgesIgnoringSafeArea(.top)
                    }.edgesIgnoringSafeArea(.top)
                        .padding(.horizontal, 30)
                        .sheet(isPresented: $showSettings, content: {
                            SettingsView(people: $people)
                        })
                )
            if people.image == nil {
                Image(people.sex)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else {
                Image(uiImage: people.image!)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(50)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }
    }
}

struct HeaderPreviewContainer_2: View {
    @State var lol: UserInfo = .init(name: "Ksenia", surname: "Perova", age: 18, nickname: "ksu", password: "123", sex: "female")

    var body: some View {
        Header(people: $lol)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HeaderPreviewContainer_2()
    }
}
