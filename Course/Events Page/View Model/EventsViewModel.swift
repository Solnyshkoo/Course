import CoreData
import Foundation
import SwiftUI
import UIKit

final class EventsViewModel: ObservableObject {
    @StateObject private var service = APIService()
    @Published var info = [EventsModel]()

    init() {
        service.getEventsList(page: 1, completion: { [self] result in
            switch result {
            case .success(let data):
                for num in 0 ..< data.count {
                    let k = EventsModel(id: data[num].id, shortTitle: data[num].title, image: self.loadImage(url: URL(string: data[num].images[0].image)!) ?? Image("nopic"))
                    self.info.append(k)
                }
            
            case .failure(let error):
                print("Eror: \(error.localizedDescription)")
            }
            
        })
    }
    
    func createdata(data: [Result]) {}
    
    func loadImage(url: URL) -> Image? {
        guard let data = try? Data(contentsOf: url) else { return nil }
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
