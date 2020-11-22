//
//  PhotoTableViewCell.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typiImageView: UIImageView!
    
    // MARK: - Public properties
    static let id = "photoCellIdentifier"
    
    // MARK: - Private properties
    private var task: URLSessionDataTask?

    // MARK: - Life Circle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Need to cancel URLSessionDataTask for not loaded image.
        /// During fast scrolling URLSessionDataTask preview previous cashed image.
        task?.cancel()
        task = nil
    }
    
    // MARK: - Public Methods
    func setup(_ photo: PhotoViewModel.Output) {
        titleLabel.text = photo.title
        if task == nil {
            task = typiImageView.downloadImage(from: photo.thumbnailUrl)
        }
    }
    
    // MARK: - Private Methods
    private func configureViews() {
        typiImageView.layer.cornerRadius = UIConfig.typiCornerRadius
        typiImageView.clipsToBounds = true
    }
}

fileprivate struct UIConfig {
    static let typiCornerRadius = CGFloat(8)
}
