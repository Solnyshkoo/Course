//
//  EventCell.swift
//  Course
//
//  Created by Ksenia Petrova on 15.03.2022.
//

import Foundation
import SwiftUI
struct EventCell: View {
    var event: EventsModel
    var body: some View {
        HStack(alignment: .top) {
            event.image
                .resizable()
                .frame(width: 155 ,height: 80)
                .clipShape(Rectangle())
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 10).padding(.trailing, 15)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(event.shortTitle)
                        .font(.title2)
                        .padding(.top, 10)
                    
                }
                
//                Text("\(event.dataBegin) - \(event.dataEnd)")
//                    .font(Font.system(size: 15, design: .default))
//                    .foregroundColor(Color(.systemGray))
//                    .padding(.top, 1)
            }
            Spacer()
        }.frame(height: 90)
        .padding()
    }
}

struct EventCellPreviewContainer_2: View {
    @State var lol: EventsModel = .init(id: 5, shortTitle: "Вечеринка диско", image: Image("nopic"))

    var body: some View {
        EventCell(event: lol)
    }
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
        EventCellPreviewContainer_2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
