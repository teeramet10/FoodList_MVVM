//
//  FoodListViewModel.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
import RxSwift

class FoodListViewModel : FoodListViewModelOutputProtocol , FoodListViewModelType{
  
    var inputs: FoodListViewModelInputProtocol {return self}
    var outputs: FoodListViewModelOutputProtocol {return self}
    
    var didError: ((String) -> Void)?
    var didUpdateData: (() -> Void)?
    
    var repository : FoodRepositoryProtocol
    private let disposeBag  = DisposeBag()
    
    var list: [FoodListModel] = []
        
    init(repository : FoodRepositoryProtocol){
        self.repository = repository
    }
}

extension FoodListViewModel : FoodListViewModelInputProtocol{
   
    func requestData() {
        repository.getFoodList().bind().subscribe(onNext: { [weak self] list in
            guard let `self` = self else{return}
            var newList : [FoodListModel] = []
            list.forEach{data in
                if (newList.count+1)%5 == 0{
                    newList.append(.imageInsertion)
                }
                var model = data.toModel()
                model.like = Int.random(in: 1000...9999).toFormat()
                newList.append(.data(food: model))
            }
            self.list = newList
            self.outputs.didUpdateData?()
        }, onError: {[weak self]error in
            guard let `self` = self else{return}
            self.outputs.didError?(error.localizedDescription)
        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
    
    }
}
