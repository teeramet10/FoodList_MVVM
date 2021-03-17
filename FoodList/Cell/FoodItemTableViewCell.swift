//
//  FoodItemTableViewCell.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {

    static let identifier = "FoodItemTableViewCell"
    static let nib = UINib(nibName: FoodItemTableViewCell.identifier, bundle: nil)
    
    @IBOutlet weak var imgFood : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var likeLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgFood.layer.cornerRadius = 10
        
    }
    
    func configCell(_ data : FoodModel?){
        guard let data = data else {return}
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        descriptionLabel.sizeToFit()
        likeLabel.text = data.like
        ImageUtils.loadImage(imgFood, data.picture)
    }
}
