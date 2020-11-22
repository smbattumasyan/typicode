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
    private var viewModel: PhotoListViewModel!
    private var tableViewDataSource: PhotoTableViewDataSource!
   
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PhotoListViewModel(self)
        tableViewDataSource = PhotoTableViewDataSource(self.viewModel, tableView: tableView)
        tableView.dataSource = tableViewDataSource
        viewModel.loadPhotos(page: 1)
    }
}

extension PhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = PhotoPreviewViewController.storyboardInstance {
            vc.viewModelOutput = tableViewDataSource.photoViewModel(at: indexPath)
            present(vc, animated: true, completion: nil)
        }
    }
}

extension PhotosViewController: PhotoListViewModelDelegate {
    func parsePhotosSuccess() {
    }
    
    func parsePhotosFailedWithMessage(_ message: String) {
        showAlert("Error", message: message)
    }
}
