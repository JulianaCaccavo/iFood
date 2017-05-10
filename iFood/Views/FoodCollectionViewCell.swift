//
//  FoodCollectionViewCell.swift
//  iFood
//
//  Created by Matias Fernandez on 10/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel:UILabel?
    @IBOutlet private weak var foodImageView:UIImageView?

    
    func updateData(_ food: Food) {
        titleLabel?.text = food.name
        foodImageView?.image = UIImage(named: food.name)
    }
    
}
