//
//  Places.swift
//  petProject
//
//  Created by Сергей Бондарчук on 30.01.2021.
//
import UIKit
import Foundation

struct Places {
    var name: String
    var type: String?
    var image: UIImage?

    static let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]

    static func getPlaces() -> [Places] {
        
        var places = [Places]()
        
        for place in restaurantNames {
            places.append(Places(name: place, type: "Ресторан", image: nil))
        }
        
        return places
    }
}
