//
//  AuthorizationView.swift
//  Course
//
//  Created by Ksenia Petrova on 09.03.2022.
//

import Foundation
import SwiftUI
struct RegistrationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var name = ""
    @State var surname = ""
    @State var patronymic = ""
    @State var age = ""
    @State var number = ""
    @State private var showingRegistrationView = false
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    VStack {
                        Text("Registration").fontWeight(.heavy).font(.largeTitle).padding([.top, .bottom], 35)
                        VStack(alignment: .leading) {
                            ClassicTextField(labelText: "Name", fieldText: "Write your name", user: $name).padding(.bottom, 15)
               
                            ClassicTextField(labelText: "Surname", fieldText: "Write your Surname", user: $surname).padding(.bottom, 15)
               
                            ClassicTextField(labelText: "Patronymic", fieldText: "Write your patronymic", user: $patronymic).padding(.bottom, 15)
               
                            ClassicTextField(labelText: "Age", fieldText: "Write your age", user: $age).padding(.bottom, 15)
               
                            ClassicTextField(labelText: "Number", fieldText: "Write your number", user: $number).padding(.bottom, 15)
                        }.padding(.horizontal, 6)
                    }.padding()
                    VStack {
                        Button(action: {self.showingRegistrationView.toggle()}) {
                            Text("Continue").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
                      
                        }.background(ColorPalette.logInButtons)
                            .clipShape(Capsule())
                            .padding(.top, 15).foregroundColor(ColorPalette.activeText).fullScreenCover(isPresented: $showingRegistrationView) {
                                MailConfirmationView(restorePassword: false)
                            }
                    }
                }.padding(.bottom, 220)
                    .navigationBarBackButtonHidden(true)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigation) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(ColorPalette.navigationBarItem)
                                .onTapGesture {
                                    self.mode.wrappedValue.dismiss()
                                }
                        }
                    })
            }
            Spacer()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
