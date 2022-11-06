//
//  AnimalsRequest.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 02/11/2022.
//

import Foundation

enum AnimalsRequest: RequestProtocol{
       
    case getAnimalsWith(page: Int, latitude: Double?, longitude: Double?)
    
    case getAnimalsBy(name: String, age: String?, type: String?)
    
    var path: String{
        "/v2/animals"
    }
    
    var urlParams: [String : String?] {
        
        switch self {
        case .getAnimalsWith(let page, let latitude, let longitude):
            var params = [ "page" : String(page) ]
            
            if let latitude = latitude{
                params["latitude"] = String(latitude)
            }
            
            if let longitude = longitude{
                params["longitude"] = String(longitude)
            }
            
            params["sort"] = "random"
            
            return params
            
        case .getAnimalsBy(let name, let age, let type):
            var params: [String : String] = [:]
            
            if !name.isEmpty{
                params["name"] = name
            }
            
            if let age = age{
                params["age"] = String(age)
            }
            
            if let type = type{
                params["type"] = String(type)
            }
            
            return params
        }
    }

    var requestType: RequestType{
        .Get
    }
}
