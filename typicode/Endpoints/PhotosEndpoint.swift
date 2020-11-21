//
//  PhotosEndpoint.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

enum PhotosEndpoint {
    case get(page: Int)
}

extension PhotosEndpoint: Endpoint {
    
    var baseUrl: String {
        return "http://localhost:3000"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .get (_):
            return "/photos"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "_page", value: "1")]
    }
}
