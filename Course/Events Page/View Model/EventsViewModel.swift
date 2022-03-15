//
//  EventsViewModel.swift
//  Course
//
//  Created by Ksenia Petrova on 15.03.2022.
//

import Foundation
import SwiftUI
final class EventsViewModel: ObservableObject {
    @StateObject private var service = APIService()
    @State private var events: [EventsModel] = []
    func getEvents(page: Int) -> [EventsModel] {
        let apiEvents = service.getEventsList(page: page)
        for num in 0..<apiEvents.count {
            events.append(EventsModel(id: apiEvents[num].id, shortTitle: apiEvents[num].shortTitle, image: self.loadImage(url:URL(string: apiEvents[num].images.image)!) ?? Image("nopic") , dataBegin:
                                        self.converData(timestamp: apiEvents[num].dates.start), dataEnd:  self.converData(timestamp: apiEvents[num].dates.end)))
        }
       
        return events
    }
    
    
    func loadImage(url: URL) -> Image? {
            guard let data = try? Data(contentsOf: url) else {return nil}
            let img = UIImage(data: data)
        return Image(uiImage: img!)
    }
    
    func converData(timestamp: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let stringDate: String = dateFormatter.string(from: date as Date)
        return stringDate
    }
}
