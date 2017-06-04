//
//  BoozeNameTableViewCell.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 04.06.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class BoozeNameTableViewCell: UITableViewCell {

    @IBOutlet weak var boozeNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
