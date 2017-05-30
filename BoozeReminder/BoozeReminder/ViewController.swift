//
//  ViewController.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 30.05.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bcgImage: UIImageView!
    @IBOutlet weak var appNameImage: UIImageView!
    @IBOutlet weak var beersButton: UIButton!
    @IBOutlet weak var vodkasButton: UIButton!
    @IBOutlet weak var vinesButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameImage.backgroundColor = UIColor.black
        bcgImage.backgroundColor = UIColor.darkGray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

