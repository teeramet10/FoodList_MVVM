//
//  UIViewController+.swift
//  FoodList
//
//  Created by Yumi JIn on 17/3/2564 BE.
//

import Foundation
import UIKit
extension UIViewController{
    func showAlert(_ message : String){
        guard message != "" else{return}
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action in
            
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
