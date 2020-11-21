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
        tableViewDataSource = PhotoTableViewDataSource(self.viewModel)
        tableView.dataSource = tableViewDataSource
        viewModel.parsePhotosJson()
    }
}

extension PhotosViewController: PhotoListViewModelDelegate {
    func parsePhotosSuccess() {
        self.tableView.reloadData()
    }
    
    func parsePhotosFailedWithMessage(_ message: String) {
        showAlert("Error", message: message)
    }
}
