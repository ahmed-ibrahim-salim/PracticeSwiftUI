//
//  AuthTockenRequest.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 01/11/2022.
//

import Foundation

enum AuthTokenRequest: RequestProtocol{
    
    case auth
    
    var path: String {
        "/v2/oauth2/token"
    }
    
    var bodyParams: [String : Any] {
        [
            "grant_type"    : APIConstants.grantType,
            "client_id"     : APIConstants.clientId,
            "client_secret" : APIConstants.clientSecret
        ]
    }
    
    var addAuthorizationToken: Bool{
        false
    }
    
    var requestType: RequestType{
        .POST
    }
    
}
