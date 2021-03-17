//
//  FoodListViewModel.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
class FoodListViewModel {
    
    var list : [FoodListModel]? = []
    
    var repository : FoodRepositoryProtocol
    
    var onFetchDataSuccess : (()->Void)?
    
    init(repository : FoodRepositoryProtocol){
        self.repository = repository
    }
}

extension FoodListViewModel : FoodListViewModelProtocol{
    func requestData() {
        let list = repository.getFoodList()
        
        self.list = list.enumerated().map{(index , data) in
            if index % 5 == 1{
                return .imageInsertion
            }else{
                return .data(food: data)
            }
        }
        
        self.onFetchDataSuccess?()
    }
}
