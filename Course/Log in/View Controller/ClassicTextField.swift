//
//  ClassicTextField.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI

struct ClassicTextField : View {
    var labelText : String
    var fieldText : String
   // var width: CGFloat
    @Binding var user: String
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
            
            HStack{
                
                TextField("Enter Your Username", text: $user)
                
            }
            
            Divider()
            
        }
    }
}
