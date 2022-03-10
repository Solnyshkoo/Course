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
    @State var mail = ""
    @State var number = ""
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
               
                            ClassicTextField(labelText: "Mail", fieldText: "Write your mail", user: $mail).padding(.bottom, 15)
               
                            ClassicTextField(labelText: "Number", fieldText: "Write your number", user: $number).padding(.bottom, 15)
                        }.padding(.horizontal, 6)
               
                    }.padding()
                    VStack {
                        Button(action: {}) {
                            Text("Sign Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                      
                        }.background(Color.green)
                            .clipShape(Capsule())
                            .padding(.top, 15)
                    }
                }.padding(.bottom, 220)
                    // padding(.top, 55)
                    .navigationBarBackButtonHidden(true)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigation) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    self.mode.wrappedValue.dismiss()
                                }
                        }
                    })
              
            }
            Spacer()
        }
    }
//        VStack {
//            NavigationView {
//                Text("")
//                    .navigationBarBackButtonHidden(true)
//                    .toolbar(content: {
//                        ToolbarItem(placement: .navigation) {
//                            Image(systemName: "arrow.left")
//                                .foregroundColor(.blue)
//                                .onTapGesture {
//                                    self.mode.wrappedValue.dismiss()
//                                }
//                        }
//                    })
//            }
//            Text("Registration").fontWeight(.heavy).font(.largeTitle).padding([.top, .bottom], 20)
//
//            VStack {
//                VStack(alignment: .leading) {
//                    ClassicTextField(labelText: "Name", fieldText: "Write your name", user: $name).padding(.bottom, 15)
//
//                    ClassicTextField(labelText: "Name", fieldText: "Write your name", user: $name).padding(.bottom, 15)
//
//                    ClassicTextField(labelText: "Name", fieldText: "Write your name", user: $name).padding(.bottom, 15)
//
//                    ClassicTextField(labelText: "Name", fieldText: "Write your name", user: $name).padding(.bottom, 15)
//
//                    ClassicTextField(labelText: "Name", fieldText: "Write your name", user: $name).padding(.bottom, 15)
//
//                    Divider()
//                }
//            }
//            Spacer()
//        }
        
//        VStack {
//            Text("View 2")
//              .navigationBarBackButtonHidden(true)
//              .toolbar(content: {
//                 ToolbarItem (placement: .navigation)  {
//                    Image(systemName: "arrow.left")
//                    .foregroundColor(.blue)
//                    .onTapGesture {
//                        // code to dismiss the view
//                        self.mode.wrappedValue.dismiss()
//                    }
//                 }
//              })
//        }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
