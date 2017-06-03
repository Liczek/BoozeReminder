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
    
    var fetchResultController: NSFetchedResultsController<Beer>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = collectionView!.frame.width / 3
        let height = (collectionView!.frame.height - 75) / 4
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        
        
        let addBeerButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(addCategoryAlert))
        navigationItem.rightBarButtonItem = addBeerButton
        
        }
    
    func addCategoryAlert() {
        
        print("test")
    }
    
    
    
}

extension BeerCollectionView {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beerBottle", for: indexPath) as! BeerCollectionViewCell
        
        cell.mainNameLabel.text = "Very good Beer nr \(indexPath.row)"
        //cell.aditionalNameLabel.text = "no aditional text"
        cell.bottleImage.image = #imageLiteral(resourceName: "bottle_brown")
        cell.beerLogoImage.image = #imageLiteral(resourceName: "Carlsberg")
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
    
    
}
