//
//  EditBoozeViewController.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 03.06.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class EditBoozeViewController: UIViewController {
    
    var tableView: UITableView!
    var boozeImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self

        title = "Edit Your Booze"
    }
    
}

extension EditBoozeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "boozeCell", for: indexPath) as! EditBoozeTableViewCell
            if (boozeImage != nil) {
                cell0.bottleImage.image = #imageLiteral(resourceName: "bottle_brown")
                cell0.boozeImageView.image = boozeImage
            }
            cell = cell0
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "boozeNameCell", for: indexPath)
            cell1.detailTextLabel?.text = "Unnamed"
            cell = cell1
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "boozeDetailsCell", for: indexPath)
            cell2.detailTextLabel?.text = "More details about this Booze"
            cell = cell2
        }       
        return cell
    }
}

extension EditBoozeViewController: UITableViewDelegate {
    
}
