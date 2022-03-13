//
//  MainView.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI
struct MainView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject private var mainViewMode = LogInViewModel()
    @State var man = UserInfo()
    @State var enterText: String = ""
    @State var user = ""
    @State var pass = ""
    @State var hidde = true
    @State private var showingRegistrationView = false
    @State private var showingRestoringView = false
    @State private var showingHoneView = false
    var body: some View {
        VStack {
            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top, .bottom], 20)
            VStack {
                VStack(alignment: .leading) {
                    ClassicTextField(labelText: "Username", fieldText: "Enter Your Username", user: $user).padding(.bottom, 15)
                    SecretTextField(labelText: "Password", fieldText: "Enter Your Password", pass: $pass)
                    Button(action: { showingRestoringView.toggle() }) {
                        Text("Forget password?").font(Font.system(size: 12, design: .default)).padding([.top, .leading], 5)
                    }.foregroundColor(ColorPalette.activeText).fullScreenCover(isPresented: $showingRestoringView) {
                        // TODO: запрос на сервер
                        MailConfirmationView(man: $man, restorePassword: true)
                    }
                }.padding(.horizontal, 6)
            }.padding()
            VStack {
                Button(action: {
                    self.showingHoneView.toggle()
                }) {
                    Text("Sign In").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
                }.disabled(user.isEmpty || pass.isEmpty)
                    .background(user.isEmpty || pass.isEmpty ? ColorPalette.disableButtom : ColorPalette.logInButtons)
                    .clipShape(Capsule())
                    .padding(.top, 45)
                    .fullScreenCover(isPresented: $showingHoneView) {
                        TabBar(people: $man)
                    }.onTapGesture {
                        if true {
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                
                
                Text("(or)").foregroundColor(ColorPalette.subtitle).padding(.top, 30)
                HStack(spacing: 8) {
                    Text("Don't Have An Account?").foregroundColor(ColorPalette.subtitle)
                    Button(action: {
                        showingRegistrationView.toggle()
                        
                    }) {
                        Text("Sign Up")
                    }
                    .foregroundColor(ColorPalette.activeText)
                        .fullScreenCover(isPresented: $showingRegistrationView) {
                            RegistrationView(man: $man)
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
