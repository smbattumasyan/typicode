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
        viewModel.parsePhotosJson(page: 1)
    }
}

extension PhotosViewController: PhotoListViewModelDelegate {
    func parsePhotosSuccess() {
    }
    
    func parsePhotosFailedWithMessage(_ message: String) {
        showAlert("Error", message: message)
    }
}
