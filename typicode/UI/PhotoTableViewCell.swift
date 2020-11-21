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
    
    static let id = "photoCellIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ photo: PhotoViewModel.Output) {
        self.titleLabel.text = photo.title
    }

}