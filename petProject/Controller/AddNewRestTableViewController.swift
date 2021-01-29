//
//  AddNewRestTableViewController.swift
//  petProject
//
//  Created by Сергей Бондарчук on 26.01.2021.
//

import UIKit
import SwiftUI

class AddNewRestTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: "Choose Photo", message: nil, preferredStyle: .actionSheet)
            actionSheet.addAction(.init(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            })
            actionSheet.addAction(.init(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            })
            actionSheet.addAction(.init(title: "Cancel", style: .cancel))
            self.present(actionSheet, animated: true, completion: nil)
            view.endEditing(true)
        } else {
            view.endEditing(true)
        }
    }
}

extension AddNewRestTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension AddNewRestTableViewController {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}
