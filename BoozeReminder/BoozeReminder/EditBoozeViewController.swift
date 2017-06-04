//
//  EditBoozeViewController.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 03.06.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit
import CoreData

class EditBoozeViewController: UIViewController {
    
    var tableView: UITableView!
    var boozeImage: UIImage?
    var boozeName: String?
    var boozeID: Double?
    var fetchResultController: NSFetchedResultsController<Booze>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self

        title = "Edit Your Booze"
        let back = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissEditView))
        self.navigationItem.setLeftBarButton(back, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
                cell0.boozeImageView.contentMode = .scaleAspectFit
                cell0.boozeImageView.image = boozeImage
            }
            cell = cell0
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "boozeNameCell", for: indexPath) as! BoozeNameTableViewCell
            if boozeName != nil  {
            cell1.boozeNameLabel.text = boozeName
            } else {
                cell1.boozeNameLabel.text = "Set name of Booze"
            }
            cell = cell1
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "boozeDetailsCell", for: indexPath) as! BoozeDetailsTableViewCell
            cell2.moreBoozeDetailLabel.text = "More details about this Booze"
            cell = cell2
        }       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight = CGFloat()
        if indexPath.section == 0 && indexPath.row == 0 {
            let rowHeight0 = 400
            rowHeight = CGFloat(rowHeight0)
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let rowHeight1 = 40
            rowHeight = CGFloat(rowHeight1)
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let rowHeight2 = 40
            rowHeight = CGFloat(rowHeight2)
        }
        return rowHeight
    }
}

extension EditBoozeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
           
        } else if indexPath.section == 0 && indexPath.row == 1 {
            setBoozeNameAlert()
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 2 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        var returnValue: IndexPath?
        if indexPath.section == 0 && indexPath.row == 0 {
            returnValue = nil
        } else if indexPath.section == 0 && indexPath.row == 1 {
            returnValue = indexPath
        } else if indexPath.section == 0 && indexPath.row == 2 {
            returnValue = indexPath
        }
        return returnValue
    }
}

extension EditBoozeViewController {
    func setBoozeNameAlert() {
        let setBoozeNameAlertController = UIAlertController(title: "Set Booze Name", message: "Chose Booze Category", preferredStyle: .alert)
        setBoozeNameAlertController.addTextField()
        let saveBoozeNameAlert = UIAlertAction(title: "Save", style: .default) { (action) in
            self.boozeName = setBoozeNameAlertController.textFields?[0].text
            self.boozeID = Date().timeIntervalSince1970
            self.saveBooze(boozeName: self.boozeName!, boozeID: self.boozeID!)
            self.reloadBoozeNameRow()
        }
        let cancelBoozeNameAlert = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        let resignFromAddingBoozeAlert = UIAlertAction(title: "Resign form new Booze", style: .destructive) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        setBoozeNameAlertController.textFields?[0].placeholder = "Enter new Booze name"
        setBoozeNameAlertController.addAction(saveBoozeNameAlert)
        setBoozeNameAlertController.addAction(cancelBoozeNameAlert)
        setBoozeNameAlertController.addAction(resignFromAddingBoozeAlert)
        
        present(setBoozeNameAlertController, animated: true, completion: nil)
        
    }
    
    func reloadBoozeNameRow() {
        let indexPath = IndexPath(row: 1, section: 0)
        tableView.reloadRows(at: [indexPath], with: .top)
    }
    public func dismissEditView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveBooze(boozeName: String, boozeID: Double) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managementObjectContext = appDelegate.persistentContainer.viewContext
        let booze = Booze(entity: Booze.entity(), insertInto: managementObjectContext)
        booze.boozeName = self.boozeName
        booze.id = self.boozeID!
        print(String(booze.id))
        
        do {
            try managementObjectContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func reloadDataAfterFetch() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let fetchRequest: NSFetchRequest<Booze> = Booze.fetchRequest()
        let nameSortDescriptor = NSSortDescriptor(key: "boozeName", ascending: true)
        fetchRequest.sortDescriptors = [nameSortDescriptor]
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: #keyPath(Booze.boozeName), cacheName: nil)
        
        do {
            try fetchResultController.performFetch()
        } catch let error as NSError {
            print("Error with fetching boozeName \(error)")
        }
    }
    
    
}


















