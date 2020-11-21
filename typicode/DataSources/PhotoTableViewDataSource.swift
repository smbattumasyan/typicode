//
//  PhotoTableViewDataSource.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit
import CoreData

class PhotoTableViewDataSource: NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    let viewModel: PhotoListViewModel
    let tableView: UITableView!
    
    init(_ viewModel: PhotoListViewModel, tableView: UITableView) {
        self.viewModel = viewModel
        self.tableView = tableView
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.id, for: indexPath) as! PhotoTableViewCell
        let photo = fetchedResultsController.object(at: indexPath)
        let photoViewModel = PhotoViewModel()
        let input = PhotoViewModel.Input(photo: photo)
        cell.setup(photoViewModel.transform(input))
        let objCount = fetchedResultsController.fetchedObjects?.count ?? 0
        if indexPath.row == objCount - 3 {
            let page = objCount / 20 + 1
            viewModel.parsePhotosJson(page: page)
        }
        return cell
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    lazy var fetchedResultsController: NSFetchedResultsController<PhotoCDM> = {
        // Initialize Fetch Request
        let fetchRequest:NSFetchRequest<PhotoCDM> = PhotoCDM.fetchRequest()
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStorage.shared.managedObjectContext(), sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            //print("Unresolved error \(error), \(error.userInfo)")
            abort()
        }
        return fetchedResultsController
    }()
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
     
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        default:
            break
        }
    }
     
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        default:
            break
        }
    }
     
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
