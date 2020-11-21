//
//  Photo.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

struct PhotoM: Decodable {
    let albumId: Int64
    let id: Int64
    let title: String
    let url: String
    let thumbnailUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
}
