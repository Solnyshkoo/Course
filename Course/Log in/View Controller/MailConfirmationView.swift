import Foundation
import SwiftUI
struct MailConfirmationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @StateObject private var mainViewMode = LogInViewModel()
    @Binding var man: UserInfo
    @State var enterText: String = ""
    @State var mail = ""
    @State var сoder = ""
    @State var hidde = true
    @State private var showingVideoView = false
    @State private var showTextFieldView = false
    var restorePassword: Bool
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    VStack {
                        Text("Mail Confirmation").fontWeight(.heavy).font(.largeTitle).padding(.top, 35)
                        VStack(alignment: .leading) {
                            ClassicTextField(labelText: "Mail", fieldText: "Write your mail", user: $man.mail).padding(.top, 20)

                        }.padding(.horizontal, 6)

                    }.padding()

                    VStack {
                        Button(action: {
                            self.showTextFieldView = true

                        }) {
                            Text("Send password").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
                        }.disabled(man.mail.isEmpty)
                            .background(man.mail.isEmpty ? ColorPalette.disableButtom : ColorPalette.logInButtons)
                            .clipShape(Capsule())
                            .padding(.top, 20).padding(.top, 10)
                    }
                    VStack {
                        if self.showTextFieldView {
                            checkKey(man: $man, сodef: $сoder, newPassword: restorePassword)
                        } else {
                            checkKey(man: $man, сodef: $сoder, newPassword: restorePassword).hidden()
                        }
                    }.padding()
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
        }
        Spacer()
    }
}

struct checkKey: View {
    @Binding var man: UserInfo
    @Binding var сodef: String
    @State var showPasswordView = false
    var newPassword: Bool
    var body: some View {
        VStack(alignment: .leading) {
            ClassicTextField(labelText: "Сode", fieldText: "Write code from mail", user: $сodef).padding(.top, 40)
        }.padding(.horizontal, 6)

        Button(action: {
            self.showPasswordView = true

        }) {
            Text("Check").foregroundColor(ColorPalette.mainBackground).frame(width: UIScreen.main.bounds.width - 120).padding()
        }
        .background(ColorPalette.logInButtons)
        .clipShape(Capsule())
        .padding(.top, 50).fullScreenCover(isPresented: $showPasswordView) {
            PasswordView(title: newPassword ? "Create new password" : "Set info ", twoPassword: newPassword, man: $man)
        }
    }
}
