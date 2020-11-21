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
        case .get:
            return "/photos"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .get(let page):
            return [URLQueryItem(name: "_page", value: "\(page)"), URLQueryItem(name: "_limit", value: "20")]
        }
    }
}
