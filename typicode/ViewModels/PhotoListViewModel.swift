//
//  PhotoListViewModel.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation
import CoreData

protocol PhotoListViewModelDelegate: NSObject {
    func parsePhotosSuccess()
    func parsePhotosFailedWithMessage(_ message: String)
}

class PhotoListViewModel {
    private weak var delegate: PhotoListViewModelDelegate?
    
    private var photos: [Photo] {
        didSet {
            delegate?.parsePhotosSuccess()
        }
    }
    
    init(_ delegate: PhotoListViewModelDelegate?) {
        self.delegate = delegate
        photos = []
    }
    
    /*
     Load photos json by page,
     decodes response data to Photo model,
     remove data that contains in database,
     save new data to database
     */
    func loadPhotos(page: Int) {
        NetworkService.shared.request(PhotosEndpoint.get(page: page)) { (result: Result<[Photo]>) in
            switch result {
            case .success(let photos):
                self.photos = photos
                self.deleteOldObjects(photos: photos)
                self.savePhotos(photos)
            case .failure(let error):
                self.delegate?.parsePhotosFailedWithMessage(error.localizedDescription)
            }
        }
    }
    
    /*
     Creates PhotoCDM entityDescription
     Save decoded photos to CoreData
     */
    private func savePhotos(_ photos: [Photo]) {
        let moc = CoreDataStorage.shared.managedObjectContext()
        for photo in photos {
            let entity = NSEntityDescription.entity(forEntityName: "PhotoCDM", in: moc)
            let photoCDM = NSManagedObject(entity: entity!, insertInto: moc) as? PhotoCDM
            photoCDM?.albumId = photo.albumId
            photoCDM?.id = photo.id
            photoCDM?.title = photo.title
            photoCDM?.url = photo.url
            photoCDM?.thumbnailUrl = photo.thumbnailUrl
        }
        CoreDataStorage.shared.saveContext()
    }
    
    /*
     Delete compared old photos from CoreData
     */
    private func deleteOldObjects(photos: [Photo]) {
        let storage = CoreDataStorage.shared
        let savedPhotos = storage.fetchObjects(entity: PhotoCDM.self)
        for sp in savedPhotos {
            if photos.contains(where: { $0.id == sp.id }) {
                storage.managedObjectContext().delete(sp)
            }
        }
    }
}
