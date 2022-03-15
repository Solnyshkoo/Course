import Foundation
import SwiftUI
struct PasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject private var mainViewMode = LogInViewModel()
    var title: String
    var twoPassword: Bool
    @Binding var man: UserInfo
    @State private var showingHomeView = false
    @State private var alert = false
    @State var firstPassword = ""
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
                                ClassicTextField(labelText: "Nickname", fieldText: "Write Your nickname", user: $man.nickname).padding(.bottom, 20)
                            }
                            SecretTextField(labelText: (twoPassword ? "Repeat" : "") + " Password", fieldText: "Enter Your Password" + (twoPassword ? " again" : ""), pass: $man.password).padding(.bottom, 20)
                        }.padding(.horizontal, 6)
                    }.padding()
                    if alert {
                        Text("Passwords are different").font(Font.system(size: 12, design: .default)).padding([.top, .leading], 5)
                    } else {
                        Text("Passwords are different").font(Font.system(size: 12, design: .default)).padding([.top, .leading], 5).hidden()
                    }
                    Button(action: {
                        if !twoPassword || firstPassword == man.password {
                            self.showingHomeView.toggle()
                        } else {
                            self.alert = true
                        }
                        
                    }) {
                        Text("Continue").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
                   
                    }.disabled(man.password.isEmpty || (firstPassword.isEmpty && man.nickname.isEmpty))
                        .background(man.password.isEmpty || (firstPassword.isEmpty && man.nickname.isEmpty) ?
                            ColorPalette.disableButtom : ColorPalette.logInButtons)
                        .clipShape(Capsule())
                        .padding(.top, 45)
                        .onTapGesture(perform: {})
                        .fullScreenCover(isPresented: $showingHomeView) {
                            TabBar(people: $man)
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
