//
//  PhotoPreviewViewController.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/22/20.
//

import UIKit

class PhotoPreviewViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    var viewModelOutput: PhotoViewModel.Output!
    
    // MARK: - Life Circles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewItems()
    }
    
    // MARK: - IBActions
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    private func setupViewItems() {
        _ = previewImageView.downloadImage(from: viewModelOutput.url, defaultImage: "")
        titleLabel.text = viewModelOutput.title
    }
}

extension PhotoPreviewViewController: StoryboardInstance {
    static var storyboardName: StoryboardName = .main
}

