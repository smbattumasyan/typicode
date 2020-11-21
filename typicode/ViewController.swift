//
//  ViewController.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.request(PhotosEndpoint.get(page: 1)) { (result: Result<[Photo]>) in
            switch result {
            case .success(let photos):
                print(photos)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

