//
//  AuthorizationView.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI
struct RegistrationView: View {
    var body: some View {
    Circle()
    }
    
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
