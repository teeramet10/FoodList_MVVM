//
//  FoodRepository.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
import RxSwift
class FoodRepository : FoodRepositoryProtocol {
    
    var dataSource : FoodDatasourceProtocol
    init( dataSource : FoodDatasourceProtocol){
        self.dataSource = dataSource
    }
    
    func getFoodList() -> Observable<[FoodEntity]> {
        return dataSource.getFood()
    }
}
