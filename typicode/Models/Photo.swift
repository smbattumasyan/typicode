//
//  Photo.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit
import CoreData

//Decodable Model
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

// Core Data Model
@objc(PhotoCDM)
class PhotoCDM: NSManagedObject {
    @NSManaged var id: Int64
    @NSManaged var url: String
    @NSManaged var title: String
    @NSManaged var albumId: Int64
    @NSManaged var thumbnailUrl: String
}

extension PhotoCDM {
    @nonobjc class func fetchRequest() -> NSFetchRequest<PhotoCDM> {
        return NSFetchRequest<PhotoCDM>(entityName: "PhotoCDM");
    }
}

