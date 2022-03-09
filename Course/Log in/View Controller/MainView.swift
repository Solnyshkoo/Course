//
//  MainView.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI
struct MainView: View {
    @StateObject private var mainViewMode = MainViewModel()
    @State var enterText: String = ""
    @State var user = ""
    @State var pass = ""
    @State var hidde = true
    var body: some View {
        VStack {
            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top, .bottom], 20)
            VStack {
                VStack(alignment: .leading) {
                    ClassicTextField(labelText: "Username", fieldText: "Enter Your Username", user: $user).padding(.bottom, 15)
                   
                    SecretTextField(labelText: "Password", fieldText: "Enter Your Password", pass: $pass)
                }.padding(.horizontal, 6)
               
            }.padding()
            VStack {
                Button(action: {}) {
                    Text("Sign In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                      
                }.background(Color.green)
                    .clipShape(Capsule())
                    .padding(.top, 45)
                  
                Text("(or)").foregroundColor(Color.gray.opacity(0.5)).padding(.top, 30)
                  
                HStack(spacing: 8) {
                    Text("Don't Have An Account ?").foregroundColor(Color.gray.opacity(0.5))
                      
                    Button(action: {}) {
                        Text("Sign Up")
                          
                    }.foregroundColor(.blue)
                      
                }.padding(.top, 25)
            }
        }
    }
    
//    var body: some View {
//
//        VStack(spacing: 30) {
//            ClassicButton(text: "Войти")
//
//            ClassicButton(text: "Зарегистрироваться")
//        }.onTapGesture {
//            print(enterText)
//        }
//    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
