//
//  NetworkError.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 31/10/2022.
//

import Foundation

public enum NetworkError: LocalizedError {

  case invalidServerResponse
  case invalidURL
    
  public var errorDescription: String? {
      
    switch self {
        
    case .invalidServerResponse:
      return "The server returned an invalid response."
        
    case .invalidURL:
      return "URL string is malformed."
        
    }
  }
}
