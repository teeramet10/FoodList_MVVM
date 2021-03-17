//
//  FoodRepositoryProtocol.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import Foundation
import RxSwift
protocol FoodRepositoryProtocol {
    func getFoodList() -> Observable<[FoodEntity]>
}
