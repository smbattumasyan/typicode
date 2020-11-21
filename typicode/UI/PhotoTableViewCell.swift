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
    private var task: URLSessionDataTask?
    
    static let id = "photoCellIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        task?.cancel()
        task = nil
    }
    
    func setup(_ photo: PhotoViewModel.Output) {
        titleLabel.text = photo.title
        if task == nil {
            task = typiImageView.downloadImage(from: photo.thumbnailUrl)
        }
    }
    
    private func configureViews() {
        typiImageView.layer.cornerRadius = UIConfig.typiCornerRadius
        typiImageView.clipsToBounds = true
    }
}

fileprivate struct UIConfig {
    static let typiCornerRadius = CGFloat(8)
}
