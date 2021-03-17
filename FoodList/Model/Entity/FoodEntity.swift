//
//  FoodEntity.swift
//  FoodList
//
//  Created by Yumi JIn on 17/3/2564 BE.
//

import Foundation
struct  FoodEntity : Decodable{
    var name :String? = ""
    var description : String? = ""
    var picture :String? = ""
    
    func toModel() -> FoodModel{
        var model = FoodModel()
        model.description = description
        model.picture = picture
        model.name = name
        return model
    }
}
