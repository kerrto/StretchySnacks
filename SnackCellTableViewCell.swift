//
//  SnackCellTableViewCell.swift
//  StretchySnacks
//
//  Created by Kerry Toonen on 2016-02-18.
//  Copyright © 2016 Lighthouse. All rights reserved.
//

import UIKit

class SnackCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
