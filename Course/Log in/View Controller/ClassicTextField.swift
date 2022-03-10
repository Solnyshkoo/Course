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
            
            Text(labelText).font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
            
            HStack{
                
                TextField(fieldText, text: $user)
                
            }
            
            Divider()
            
        }
    }
}
