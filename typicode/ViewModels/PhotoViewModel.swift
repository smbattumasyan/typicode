//
//  PhotoViewModel.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

class PhotoViewModel: ViewModelType {
    struct Input {
        let photo: Photo
    }
    
    struct Output {
        let title: String
        let url: String
        let thumbnailUrl: String
    }
    
    func transform(_ input: Input) -> Output {
        return Output(title: input.photo.title, url: input.photo.url, thumbnailUrl: input.photo.thumbnailUrl)
    }
}
