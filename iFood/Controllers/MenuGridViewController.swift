//
//  MenuGridViewController.swift
//  iFood
//
//  Created by Matias Fernandez on 10/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class MenuGridViewController: MenuListViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet private weak var collectionView: UICollectionView?
    
    override func reloadDataIfNeeded() {
        self.collectionView?.reloadData()
    }
    
    //MARK - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foods[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellReuseIdentifier", for: indexPath) as! FoodCollectionViewCell
        
        cell.updateData(food)
        
        return cell
    }
    
    
}
