//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct SettingsView: View {
    @State var showSetting = false
    var body: some View {
        Color.blue.ignoresSafeArea()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
