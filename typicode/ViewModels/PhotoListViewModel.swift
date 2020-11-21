//
//  PhotoListViewModel.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

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
    
    func parsePhotosJson() {
        NetworkService.shared.request(PhotosEndpoint.get(page: 1)) { (result: Result<[Photo]>) in
            switch result {
            case .success(let photos):
                self.photos = photos
                print(photos)
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.parsePhotosFailedWithMessage(error.localizedDescription)
            }
        }
        
        CoreDataStorage.shared.clearStorage(forEntity: "Photo")
        CoreDataStorage.shared.saveContext()
    }
    
    func photosCount() -> Int {
        return self.photos.count
    }
    
    func photo(atIndex index: Int) -> PhotoViewModel.Output {
        let photoViewModel = PhotoViewModel()
        let input = PhotoViewModel.Input(photo: photos[index])
        return photoViewModel.transform(input)
    }
}
