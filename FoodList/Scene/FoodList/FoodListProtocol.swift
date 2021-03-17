//
//  FoodListProtocol.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
protocol FoodListViewModelInputProtocol  {
    func requestData()
}

protocol FoodListViewModelOutputProtocol :class{
    var didError : ((String)->Void)? {get set}
    var didUpdateData :(()->Void)? {get set}
    var list : [FoodListModel] {get}
}


protocol FoodListViewModelType : FoodListViewModelInputProtocol ,FoodListViewModelOutputProtocol {
    var inputs : FoodListViewModelInputProtocol {get}
    var outputs : FoodListViewModelOutputProtocol{get}
}
