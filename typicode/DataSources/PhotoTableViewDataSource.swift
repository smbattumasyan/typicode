//
//  PhotoTableViewDataSource.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

class PhotoTableViewDataSource: NSObject, UITableViewDataSource {
    let viewModel: PhotoListViewModel
    
    init(_ viewModel: PhotoListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photosCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.id, for: indexPath) as! PhotoTableViewCell
        let photo = viewModel.photo(atIndex: indexPath.row)
        print(photo)
        cell.setup(photo)
        return cell
    }
}
