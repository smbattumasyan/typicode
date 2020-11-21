//
//  ViewController.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

class PhotosViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: PhotoListViewModel!
    
   
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PhotoListViewModel(self)
    }
}

extension PhotosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photosCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.id, for: indexPath) as! PhotoTableViewCell
        let photo = viewModel.photo(atIndex: indexPath.row)
        cell.setup(photo)
        return cell
    }
}

extension PhotosViewController: PhotoListViewModelDelegate {
    func parsePhotosSuccess() {
        self.tableView.reloadData()
    }
    
    func parsePhotosFailedWithMessage(_ message: String) {
    }
}
