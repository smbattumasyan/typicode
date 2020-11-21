//
//  Photo.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit
import CoreData

@objc(PhotoCDM)
class PhotoCDM: NSManagedObject {
    @NSManaged var albumId: Int64
    @NSManaged var id: Int64
    @NSManaged var title: String
    @NSManaged var url: String
    @NSManaged var thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
}

extension PhotoCDM {
    @nonobjc class func fetchRequest() -> NSFetchRequest<PhotoCDM> {
        return NSFetchRequest<PhotoCDM>(entityName: "PhotoCDM");
    }
}

struct Photo: Decodable {
    let id: Int64
    let url: String
    let title: String
    let albumId: Int64
    let thumbnailUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case title = "title"
        case albumId = "albumId"
        case thumbnailUrl = "thumbnailUrl"
    }
}
