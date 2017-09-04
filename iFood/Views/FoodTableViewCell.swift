//
//  FoodTableViewCell.swift
//  iFood
//
//  Created by Matias Fernandez on 10/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel:UILabel!
    @IBOutlet private weak var descriptionLabel:UILabel!
    @IBOutlet private weak var foodImageView:UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateData(_ food: Food) {
        titleLabel?.text = food.name
        descriptionLabel?.text = food.foodDescription
        foodImageView?.image = UIImage(named: food.foodImage)
        foodImageView.contentMode = .scaleAspectFit
    }
    
}
