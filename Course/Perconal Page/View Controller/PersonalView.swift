//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct PersonalView: View {
    var body: some View {
        Color.red
    }
    
    
}


struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
