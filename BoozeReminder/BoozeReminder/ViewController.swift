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
    
    @IBAction func pickImageButton(_ sender: UIButton) {
        pickPhoto()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    
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
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

