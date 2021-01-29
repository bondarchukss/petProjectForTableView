//
//  AddNewRestTableViewController.swift
//  petProject
//
//  Created by Сергей Бондарчук on 26.01.2021.
//

import UIKit
import SwiftUI

class AddNewRestTableViewController: UITableViewController {
    @IBOutlet weak var placeSave: UIBarButtonItem!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeType: UITextField!
    var newPlace: Places?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        placeSave.isEnabled = false
        
        placeName.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            self.present(actionSheet, animated: true, completion: nil)
            view.endEditing(true)
        } else {
            view.endEditing(true)
        }
    }
    @IBAction func cancelAddingNewRest(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension AddNewRestTableViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    @objc private func textDidChanged() {
        if placeName.text?.isEmpty == true {
            placeSave.isEnabled = false
        } else {
            placeSave.isEnabled = true
        }
    }
    
    func saveNewRestaurant() {
        // TODO: Переделать проставление картинки
        newPlace = Places(name: placeName.text!,
                              type: placeType.text,
                              image: placeImage.image)
    }
}

//MARK: Work with image
extension AddNewRestTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleToFill
        placeImage.clipsToBounds = true
        dismiss(animated: true)
    }
}
