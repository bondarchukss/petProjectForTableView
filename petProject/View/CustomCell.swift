//
//  CustomCell.swift
//  petProject
//
//  Created by Сергей Бондарчук on 24.01.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameOfRest: UILabel!
    @IBOutlet weak var typeOfRest: UILabel!
    @IBOutlet weak var imageOfRest: UIImageView!
    
    func configureCell(name: String, type: String, image: UIImage) {
        nameOfRest.text = name
        typeOfRest.text = type
        imageOfRest.image = image
        imageOfRest.layer.cornerRadius = frame.size.height / 2
        imageOfRest.clipsToBounds = true
    }
}
