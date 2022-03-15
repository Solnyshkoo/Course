//
//  EventCell.swift
//  Course
//
//  Created by Ksenia Petrova on 15.03.2022.
//

import Alamofire
import Foundation
import SwiftUI
import UIKit
struct EventCell: View {
    var event: EventsModel
    @Binding var people: UserInfo
    @State private var heart = false
    var body: some View {
        HStack(alignment: .top) {
            event.image
                .resizable()
                .frame(width: 155, height: 80)
                .clipShape(Rectangle())
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 10).padding(.trailing, 15)
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(event.shortTitle)
                        .font(.title2)
                        .padding(.top, 10)
                    Button(action: {
                        if people.subscribes.contains(where: { $0.id == event.id }) {
                            people.subscribes.remove(at:
                                people.subscribes.firstIndex(where: { $0.id == event.id })!)
                        } else {
                            people.subscribes.append(event)
                        }
                       
                    }) {
                        Text(people.subscribes.contains(where: { $0.id == event.id }) ? "Signed" : "Subscribe").font(Font.system(size: 12, design: .default)).padding([.top, .leading], 5)
                    }.foregroundColor(ColorPalette.activeText)
                }
                Spacer()
                Button(action: {
                    if people.favorities.contains(where: { $0.id == event.id }) {
                        people.favorities.remove(at:
                            people.favorities.firstIndex(where: { $0.id == event.id })!)
                    } else {
                        people.favorities.append(event)
                    }
                }) {
                    Image(systemName: people.favorities.contains(where: { $0.id == event.id }) ? "heart.fill" : "heart").font(Font.system(size: 15, design: .default)).padding(.top, 5)
                        .padding(.trailing, 2)
                }.foregroundColor(people.favorities.contains(where: { $0.id == event.id }) ? Color.red : ColorPalette.activeText)
            }
            Spacer()
        }.frame(height: 90)
            .padding()
    }
}

struct EventCellPreviewContainer_2: View {
    @State var lol: EventsModel = .init(id: 5, shortTitle: "Вечеринка диско", image: Image("nopic"))
    @State var lol2: UserInfo = .init(name: "Ksenia", surname: "Perova", age: 18, nickname: "ksu", password: "123", sex: "female")
    var body: some View {
        EventCell(event: lol, people: $lol2)
    }
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
        EventCellPreviewContainer_2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
