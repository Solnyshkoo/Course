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
          "page_size":"40",
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
}

