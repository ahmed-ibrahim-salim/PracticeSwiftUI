//
//  RequestProtocol.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 31/10/2022.
//

import Foundation

// request characteristics

protocol RequestProtocol{
    
    var path: String { get }
    
    var headers: [String : String] { get }
    
    // two types of params, if using POST method or sending sensitive infos
    var bodyParams: [String : Any] { get }
    
    // if using GET method appears in URL
    var urlParams: [String : String?] { get }
    
    var addAuthorizationToken: Bool { get }
    
    var requestType: RequestType { get }
    
}

// providing defaults for request protocol

extension RequestProtocol{
    
    var host: String { APIConstants.host }
    
    var addAuthorizationToken: Bool { true }
    
    // two types of params, if using POST method or sending sensitive infos
    var bodyParams: [String : Any] { [:] }
    
    // if using GET method appears in URL
    var urlParams: [String : String?] { [:] }
    
    var headers: [String : String] { [:] }
    
    func createURlRequest(authToken: String) throws -> URLRequest{
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty{
            components.queryItems = urlParams.map{
                
                URLQueryItem(name: $0.key, value: $0.value)
                
                // i edited this line, this line was in the book
//                URLQueryItem(name: $0.key, value: $1.value)
            }
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        
        // headers, MethodType added to url request
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty{
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorizationToken{
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        // More default headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    
        if !bodyParams.isEmpty{
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams)
        }
        
        return urlRequest
    }
}
