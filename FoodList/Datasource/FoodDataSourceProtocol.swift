//
//  FoodDatasourceProtocol.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
import RxSwift
protocol FoodDatasourceProtocol {
    func getFood() -> Observable<[FoodEntity]>
}
