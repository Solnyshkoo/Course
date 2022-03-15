//
//  APIService.swift
//  Course
//
//  Created by Ksenia Petrova on 15.03.2022.
//

import Foundation
import UIKit
import Alamofire
import SwiftUI

enum ObtainPostsResult {
    case success(posts: [Result])
    case failure(error: Error)
}
class APIService: ObservableObject {
    

    func getEventsList(page: Int, completion: @escaping (ObtainPostsResult)-> Void) {
        
        let url =  "https://kudago.com/public-api/v1.4/events"
        let parameters: [String: String] = [
          "lang": "en",
          "page": "\(page)",
          "page_size":"100",
          "fields": "id,slug,images,title,dates ",
          "order_by": "-publication_date"
        ]
        AF.request(url, method: .get, parameters: parameters).response { (response) in
            var result: ObtainPostsResult
            defer {
                 completion(result)
            }
                        
          guard let data = response.data else {
              result = .failure(error: errSecInternalError as! Error)
              return
              
          }
           
          let decoder = JSONDecoder()
          do {
              let places = try decoder.decode(EventsApi.self, from: data)
              result = .success(posts: places.results)
             // print(places.results)
            
          } catch let DecodingError.dataCorrupted(context) {
              result = .failure(error: errSecInternalError as! Error)
              print(context)
          } catch let DecodingError.keyNotFound(key, context) {
              result = .failure(error: errSecInternalError as! Error)
              print("Key '\(key)' not found:", context.debugDescription)
              print("codingPath:", context.codingPath)
          } catch let DecodingError.valueNotFound(value, context) {
              result = .failure(error: errSecInternalError as! Error)
              print("Value '\(value)' not found:", context.debugDescription)
              print("codingPath:", context.codingPath)
          } catch let DecodingError.typeMismatch(type, context)  {
              result = .failure(error: errSecInternalError as! Error)
              print("Type '\(type)' mismatch:", context.debugDescription)
              print("codingPath:", context.codingPath)
          } catch {
              result = .failure(error: errSecInternalError as! Error)
              print("error: ", error)
          }
            
        }
       
    }
        
        
//
//
//               URLSession.shared.dataTask(with: url) { data, repo, error in
//                   var result: ObtainPostsResult
//
//
//                   if error == nil, let parseData = data {
//
//                       print(parseData)
//                       print("_________parse")
//                       guard let post = try? JSONDecoder().decode(EventsApi.self, from: parseData) else {
//                           print(errSecInternalError)
//
//                           return
//
//                       }
//                       result = .success(posts: post)
//                   } else {
//                       result = .failure(error: error!)
//
//                   }
//                   print("_________")
//                           print(result)
//                           print("_________")
//               }.resume()
        
        
        
        
        
        
//        var components = URLComponents(string: "https://kudago.com/public-api/v1.4/events/?lang=en&order_by=-publication_date")!
////        components.queryItems = [
////            URLQueryItem(name: "page", value: "\(page)"),
////        ]
//        // 3
//        let request = URLRequest(url: components.url!, timeoutInterval: 10)
//        // 4
//        let ans = URLSession.shared.dataTaskPublisher(for: request)
//            .map(\.data)
//            .decode(type: [EventsApi].self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//        print("_________")
//        print(ans)
//        print("_________")
        
    

   
}

