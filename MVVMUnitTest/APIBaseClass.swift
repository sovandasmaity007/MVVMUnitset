//
//  APIBaseClass.swift
//  MVVMDemo
//
//  Created by AJAY on 01/06/21.
//  Copyright © 2021 Individual. All rights reserved.
//

import UIKit

class APIBaseClass: NSObject {
    
    
    static let APIBaseClassObject = APIBaseClass()

       private override init() { }
    
//    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    private let sourcesURL = URL(string: "http://13.234.17.21:5000/api/site-setting?is_active=1&lang=en")!
//successHandler: @escaping((_ responseObject: JSON)->Void)
    func apiToGetSettingsData(completion : @escaping (SettingsModel) -> ()){
          
          URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
              if let data = data {
                
                    do {
                    //            let jsonEncoder = JSONEncoder()
                    //            let jsonData = try jsonEncoder.encode(newUser)
                    let jsonString = String(data: data, encoding: .utf8)
                    print(jsonString ?? "")
                    } catch {
                    print("Unexpected error: \(error).")
                    }
                
                do{
                let decoded = try JSONSerialization.jsonObject(with: data, options: [])
                 // here "decoded" is of type `Any`, decoded from JSON data
                 print(decoded)
                 // you can now cast it with the right type
                 if let dictFromJSON = decoded as? [String: Any] {
                 // use dictFromJSON
                    print(dictFromJSON["data"] ?? [])
                 }
                }catch {
                    print(error.localizedDescription)
                }
                
                  let jsonDecoder = JSONDecoder()
                  
                  let empData = try! jsonDecoder.decode(SettingsModel.self, from: data)
              
                      completion(empData)
              }
              
          }.resume()
      }
}


//    let requestDataArr: [String: Any] = ["name": "XYZ", "email": "test@teest.com", "phone": 96982879]
//
//    do {
//    let jsonData = try JSONSerialization.data(withJSONObject: requestDataArr, options: .prettyPrinted)
//    // here "jsonData" is the dictionary encoded in JSON data
//    print(jsonData)
//
//    do {
//    //            let jsonEncoder = JSONEncoder()
//    //            let jsonData = try jsonEncoder.encode(newUser)
//    let jsonString = String(data: jsonData, encoding: .utf8)
//    print(jsonString ?? "")
//    } catch {
//    print("Unexpected error: \(error).")
//    }
//
//    let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
//    // here "decoded" is of type `Any`, decoded from JSON data
//    print(decoded)
//    // you can now cast it with the right type
//    if let dictFromJSON = decoded as? [String: Any] {
//    // use dictFromJSON
//    print(dictFromJSON)
//    }
//    }catch {
//        print(error.localizedDescription)
//    }
