//
//  ProfileSettings.swift
//  Course
//
//  Created by Ksenia Petrova on 14.03.2022.
//

import Foundation
import SwiftUI
struct ProfileSettings: View {
    @Binding var people: UserInfo
    @State private var changePhoto = false
    var years = Array(16 ... 100)
    var body: some View {
        Section(header: Text("Profile")) {
            Button(
                action: {
                    self.changePhoto.toggle()
                },
                label: {
                    Text("Pick Profile Image")
                }
            ).sheet(isPresented: $changePhoto) {
                ImagePicker(image: $people.image, isPresented: $changePhoto)
            }

            TextField("Name", text: $people.name)
            TextField("Surname", text: $people.surname)
            TextField("Nickname", text: $people.nickname)
    
            VStack(alignment: .leading) {
                Picker("Sex", selection: $people.sex) {
                    Text("none").tag("none")
                    Text("female").tag("female")
                    Text("male").tag("male")
                }.padding(.bottom, -3)
                    .colorMultiply(.black)
            }
            
            VStack(alignment: .leading) {
                Picker("Age", selection: $people.age) {
                    ForEach(years, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never)))")
                    }
                }.padding(.bottom, -3)
                    .colorMultiply(.black)
            }
        }
    }
}
