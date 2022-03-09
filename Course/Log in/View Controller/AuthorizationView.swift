//
//  AuthorizationView.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI
struct AuthorizationView: View {
    var body: some View {
    Circle()
    }
    
    
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
