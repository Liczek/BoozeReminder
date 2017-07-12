//
//  BeerCollectionView.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 30.05.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit
import CoreData

class BeerCollectionView: UICollectionViewController {
    
    var fetchResultController: NSFetchedResultsController<Booze>!
    var boozeName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadDataAfterFetch()
        
        let width = collectionView!.frame.width / 3
        let height = (collectionView!.frame.height - 75) / 4
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        
        
        let addBeerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategoryAlert))
        navigationItem.rightBarButtonItem = addBeerButton
        
        }
    
    func addCategoryAlert() {
        performSegue(withIdentifier: "checkCoreData", sender: nil)
    }
    
    
    
}

extension BeerCollectionView {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchResultController.sections?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResultController.sections?[section].numberOfObjects ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beerBottle", for: indexPath) as! BeerCollectionViewCell
        let booze = fetchResultController.object(at: indexPath)
        
        cell.mainNameLabel.text = booze.boozeName
        //cell.aditionalNameLabel.text = "no aditional text"
        cell.bottleImage.image = #imageLiteral(resourceName: "bottle_brown")
        cell.beerLogoImage.image = UIImage(data: booze.boozeImage as! Data, scale: 0.7)
        cell.backImage.image = #imageLiteral(resourceName: "skrzynka")
        
        return cell
    }
}

extension BeerCollectionView {
    func popView() {
        let beerAlertController = UIAlertController(title: "Enter name of new beer", message: nil, preferredStyle: .alert)
        let beerSaveAlert = UIAlertAction(title: "Save", style: .default) { (action) in
            
        }
        let beerCancelAlert = UIAlertAction(title: "Cancel", style: .cancel)
        beerAlertController.addAction(beerSaveAlert)
        beerAlertController.addAction(beerCancelAlert)
        present(beerAlertController, animated: true, completion: nil)
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

extension BeerCollectionView {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBooze = fetchResultController.object(at: indexPath)
        let index = indexPath
        //let id = selectedBooze.id
        boozeName = selectedBooze.boozeName
        //let selectedBoozeID = selectedBooze.id
        print(boozeName! as String)
        performSegue(withIdentifier: "goAndEditSelectedBooze", sender: index)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goAndEditSelectedBooze" {
            let vc = segue.destination as! UINavigationController
            let controller = vc.topViewController as! EditBoozeViewController
            controller.indexPath = sender as! IndexPath?
        }
    }
}
