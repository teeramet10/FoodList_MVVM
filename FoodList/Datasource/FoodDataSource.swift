//
//  FoodDatasource.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
import RxSwift
class FoodDataSource : FoodDatasourceProtocol{
    
    func getFood() -> Observable<[FoodEntity]>  {
        return .create{ e in
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
