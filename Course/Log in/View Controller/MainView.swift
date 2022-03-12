//
//  MainView.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI
struct MainView: View {
    @StateObject private var mainViewMode = LogInViewModel()
    @State var enterText: String = ""
    @State var user = ""
    @State var pass = ""
    @State var hidde = true
    @State private var showingRegistrationView = false
    @State private var showingRestoringView = false
    var body: some View {
        VStack {
            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top, .bottom], 20)
            VStack {
                VStack(alignment: .leading) {
                    ClassicTextField(labelText: "Username", fieldText: "Enter Your Username", user: $user).padding(.bottom, 15)
                    SecretTextField(labelText: "Password", fieldText: "Enter Your Password", pass: $pass)
                    Button(action: {showingRestoringView.toggle()}) {
                        Text("Forget password?").font(Font.system(size: 12, design: .default)).padding([.top, .leading], 5)
                    }.foregroundColor(ColorPalette.activeText).fullScreenCover(isPresented: $showingRestoringView) {
                        MailConfirmationView(restorePassword: true)
                    }
                }.padding(.horizontal, 6)
            }.padding()
            VStack {
                Button(action: {}) {
                    Text("Sign In").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
                }.background(ColorPalette.logInButtons)
                    .clipShape(Capsule())
                    .padding(.top, 45)
                Text("(or)").foregroundColor(ColorPalette.subtitle).padding(.top, 30)
                HStack(spacing: 8) {
                    Text("Don't Have An Account ?").foregroundColor(ColorPalette.subtitle)
                    Button(action: {showingRegistrationView.toggle()}) {
                        Text("Sign Up")
                    }.foregroundColor(ColorPalette.activeText).fullScreenCover(isPresented: $showingRegistrationView) {
                        RegistrationView()
                    }     
                }.padding(.top, 25)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
