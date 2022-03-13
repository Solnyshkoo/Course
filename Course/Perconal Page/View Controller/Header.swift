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
    var sex: String
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue / 255, green: gValue / 255, blue: bValue / 255))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)

            Image(sex)
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())

                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(sex: "female").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
