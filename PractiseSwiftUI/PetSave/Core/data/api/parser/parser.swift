//
//  parser.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 01/11/2022.
//

import Foundation



protocol DataParserProtocol{
    
    func parse<T: Decodable>(data: Data) throws -> T
    
}

class DataParser: DataParserProtocol{
    
    private var jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse<T:Decodable>(data: Data) throws -> T{
         try jsonDecoder.decode(T.self, from: data)
    }
    
}
