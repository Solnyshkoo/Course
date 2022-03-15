//
//  EventsViewModel.swift
//  Course
//
//  Created by Ksenia Petrova on 15.03.2022.
//

import Foundation
import SwiftUI
import UIKit
import CoreData
enum Ans {
    static var ans = [EventsModel]()
}
final class EventsViewModel: ObservableObject {
    @StateObject private var service = APIService()
    @Published var info = [EventsModel]()

    init() {
        service.getEventsList(page: 1, completion: { [self] result in
        switch result{
        case .success(let data) :
            for num in 0..<data.count {
                let k = EventsModel(id: data[num].id, shortTitle:  data[num].title, image: self.loadImage(url:URL(string:  data[num].images[0].image)!) ?? Image("nopic"))
                self.info.append(k)
            }
            
        case .failure(let error):
            print("Eror: \(error.localizedDescription)")
        }
            
    })
    }
    
    
        
    
    
      
       // for num in 0..<apiEvents.count {
//            events.append(EventsModel(id: apiEvents[num].id, shortTitle: apiEvents[num].shortTitle, image: self.loadImage(url:URL(string: apiEvents[num].images.image)!) ?? Image("nopic") , dataBegin:
//                                        self.converData(timestamp: apiEvents[num].dates.start), dataEnd:  self.converData(timestamp: apiEvents[num].dates.end)))
     //   }
      
    
    
    func createdata(data: [Result]){
    
       
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
