//
//  PasswordView.swift
//  Course
//
//  Created by Ksenia Petrova on 10.03.2022.
//

import Foundation
import SwiftUI
struct PasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var title: String
    var twoPassword: Bool
    @State private var showingHomeView = false
    @State var firstPassword = ""
    @State var secondPassword = ""
    @State var nickname = ""
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    VStack {
                        Text(title).fontWeight(.heavy).font(.largeTitle).padding([.top, .bottom], 40)
                        VStack(alignment: .leading) {
                            if self.twoPassword {
                                SecretTextField(labelText: "Password", fieldText: "Enter Your Password", pass: $firstPassword).padding(.bottom, 20)
                            } else {
                                ClassicTextField(labelText: "Nickname", fieldText: "Write Your nickname", user: $nickname).padding(.bottom, 20)
                            }
                            SecretTextField(labelText: (twoPassword ? "Repeat" : "")  + " Password", fieldText: "Enter Your Password" + (twoPassword ? " again" : ""), pass: $secondPassword).padding(.bottom, 20)
                        }.padding(.horizontal, 6)
                    }.padding()
                    Button(action: {self.showingHomeView.toggle()}) {
                        Text("Continue").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
                   
                    }.background(ColorPalette.logInButtons)
                        .clipShape(Capsule())
                        .padding(.top, 45).fullScreenCover(isPresented: $showingHomeView) {
                            TabBar()
                        }
                }.padding(.bottom, 250)
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
        }
    }
}

