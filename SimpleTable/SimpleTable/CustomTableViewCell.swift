//
//  CustomTableViewCell.swift
//  SimpleTable
//
//  Created by user on 2023/06/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
