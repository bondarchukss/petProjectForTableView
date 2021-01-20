//
//  TestDataForPetProject.swift
//  petProject
//
//  Created by Сергей Бондарчук on 19.01.2021.
//

import Foundation

struct DataForProject {

    static let italian = ["Практика by Darvin", "ИТАЛОНИЯ", "Остерия Марио", "Виа Романо"]
    static let japanese = ["Кадриль", "Зодиак", "[KU:] рамен изакая бар"]

    enum TypesOfRestaurants: CaseIterable {
        case italian
        case japanese
    }
    
    static func getRestaurants(typeOfRestaurant: TypesOfRestaurants) -> [String] {
        switch typeOfRestaurant {
        case .italian:
            return italian
        case .japanese:
            return japanese
        }
    }

        
}