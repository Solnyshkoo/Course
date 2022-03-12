//
//  PersonalViewController.swift
//  Course
//
//  Created by Ksenia Petrova on 12.03.2022.
//

import Foundation

import SwiftUI
struct EventsView: View {
    var body: some View {
        Color.green
    }
    
    
}


struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
