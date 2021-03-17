//
//  FoodListProtocol.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
protocol FoodListViewModelProtocol  {
    var onFetchDataSuccess : (()-> Void)? {get set}
    
    
    func requestData()
}
