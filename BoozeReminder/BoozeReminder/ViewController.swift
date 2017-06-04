//
//  ViewController.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 30.05.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var beerImage: UIImage?
    
    @IBOutlet weak var bcgImage: UIImageView!
    @IBOutlet weak var appNameImage: UIImageView!
    @IBOutlet weak var beersButton: UIButton!
    @IBOutlet weak var vodkasButton: UIButton!
    @IBOutlet weak var vinesButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    
    @IBAction func pickImageButton(_ sender: UIButton) {
        pickPhoto()
    }
    
    @IBAction func vodkasCollection(_ sender: UIButton) {
        performSegue(withIdentifier: "goToEditBooze", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameImage.backgroundColor = UIColor.black
        bcgImage.backgroundColor = UIColor.darkGray
        photoButton.adjustsImageWhenHighlighted = true
        photoButton.setImage(UIImage(named: "Camera"), for: .normal)
        photoButton.tintColor = UIColor.white
        photoButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vodkasButton.autoresizesSubviews = false
        vodkasButton.contentMode = .scaleAspectFit
        if (beerImage != nil) {
        vodkasButton.setBackgroundImage(beerImage, for: .normal)
        } else {
            vodkasButton.setBackgroundImage(#imageLiteral(resourceName: "Chang"), for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickPhoto() {
        if true || UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            takePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.takePhotoFromCamera()
        }
        let libraryAction = UIAlertAction(title: "Library", style: .default) { (action) in
            self.takePhotoFromLibrary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        present(alertController, animated: true, completion: nil)
    }
    func takePhotoFromCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    func takePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
        
        beerImage = image
        
        }
        
//        guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "goToEditBooze") as? EditBoozeViewController else {
//            print("Could not instantiate view controller with identifier of type SecondViewController")
//            return
//        }
//        
//        self.navigationController?.pushViewController(vc, animated:true)
        dismiss(animated: true, completion: goToEditMode)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func goToEditMode() {
        performSegue(withIdentifier: "goToEditBooze", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditBooze" {
            let vc = segue.destination as! UINavigationController
            let controller = vc.viewControllers[0]  as! EditBoozeViewController
            controller.boozeImage = beerImage
        }
    }
    
    
    
    
    
}

