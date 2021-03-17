//
//  RxSwift+.swift
//  FoodList
//
//  Created by Yumi JIn on 17/3/2564 BE.
//

import Foundation
import RxSwift

extension Observable{
    
    func bind() -> Observable<E>{
        return self.subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background)).observeOn(MainScheduler.instance)
    }
}
