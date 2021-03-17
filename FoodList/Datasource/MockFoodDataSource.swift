//
//  MockFoodDataSource.swift
//  FoodList
//
//  Created by Yumi JIn on 17/3/2564 BE.
//

import Foundation
import RxSwift
class MockFoodDataSource : FoodDatasourceProtocol{
    
    var isSuccess : Bool
    init(isSuccess : Bool){
        self.isSuccess = isSuccess
    }
    
    func getFood() -> Observable<[FoodEntity]>  {
        return .create{e in
            guard self.isSuccess else{
                e.onError(ErrorMessage.error(errorMessage: "Error"))
                return Disposables.create()
            }
            guard let url = Bundle.main.url(forResource: "FoodData", withExtension: "json") else{
                return Disposables.create()
            }
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let list = try decoder.decode([FoodEntity].self, from: data)
                e.onNext(list)
            } catch {
                e.onError(error)
                print("error:\(error)")
            }
            e.onCompleted()
            return Disposables.create()
            
        }
        
    }
}
