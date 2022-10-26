//
//  Network.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 26/10/2022.
//

import Foundation
import Alamofire


typealias NetworkCompletion<T> = (AFResult<T>) -> ()

protocol NetworkProtocol {
    func request<T:Codable>(_ request: URLRequestConvertible, decodeTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>)
    
//    func upload<T:Codable>(_ request: URLRequestConvertible, data: [UploadData]?, decodedTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>)
}
