//
//  DataCell.swift
//  BT
//
//  Created by Mahima Personal on 21/02/24.
//

import UIKit


class DataCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: CachedImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    func setupCell(with value: DataValue) {
        if let avatarString = value.avatar {
            avatarImageView.loadImage(from: avatarString)
        }
        idLabel.text = "ID: \(value.id ?? 0)"
        lastNameLabel.text = "\(value.lastName ?? "")"
        firstNameLabel.text = "\(value.firstName ?? "")"
    }
    
}
