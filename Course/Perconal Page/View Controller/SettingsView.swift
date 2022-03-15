import SwiftUI

struct SettingsView: View {
    @Binding var people: UserInfo
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                HeaderBackgroundSliders()
                ProfileSettings(people: $people)
                Favorites(people: $people)
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing:
                Button(
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("Done")
                    }
                )
            )
        }
    }
}

struct Favorites: View {
    @Binding var people: UserInfo
    @State private var showFavorite = false
    var body: some View {
        Section(header: Text("My info")) {
            HStack {
                Text("Favorite")
            }.onTapGesture {
                self.showFavorite.toggle()
            }.fullScreenCover(isPresented: $showFavorite) {
                FavoriteView(people: $people)
            }
        }
    }
}

struct HeaderBackgroundSliders: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue

    var body: some View {
        Section(header: Text("Header Background Color")) {
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 100)
                        .foregroundColor(Color(red: rValue / 255, green: gValue / 255, blue: bValue / 255))
                }
                VStack {
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $gValue, textColor: .green)
                    colorSlider(value: $bValue, textColor: .blue)
                }
            }
        }
    }
}

struct colorSlider: View {
    @Binding var value: Double
    var textColor: Color

    var body: some View {
        HStack {
            Text(verbatim: "0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0 ... 255)
            Text(verbatim: "255")
                .foregroundColor(textColor)
        }
    }
}

struct SettingsViewePreviewContainer_2: View {
    @State var lol: UserInfo = .init(name: "Ksenia", surname: "Perova", age: 18, nickname: "ksu", password: "123", sex: "female")

    var body: some View {
        SettingsView(people: $lol)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewePreviewContainer_2()
    }
}
