//
//  CheckCoreDataTableViewCell.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 04.06.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CheckCoreDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var boozNameLabel: UILabel!
    @IBOutlet weak var boozIDLabel: UILabel!
    @IBOutlet weak var boozImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
