//
//  MenuListViewController.swift
//  iFood
//
//  Created by Matias Fernandez on 08/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class MenuListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView?

    var foods = Array<Food>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.remoteCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK - Service Call
    
    // Esto debe estar en una layer de networking,
    // veremos como trabajar con esta arquitectura mas adelante
    func remoteCall() {
        
        self.indicatorView?.isHidden = false
        
        MenuService.getMenu({ [weak self] (foods) in
            self?.foods = foods
            self?.reloadDataIfNeeded()
            self?.indicatorView?.isHidden = true
        }) { (errorString) in
            //Display error
        }
        
    }
    
    func reloadDataIfNeeded() {
        self.tableView?.reloadData()
    }
    
        
}

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK - UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = foods[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCellIdentifier", for: indexPath) as! FoodTableViewCell
        
        cell.updateData(food)
        
        return cell
        
    }
}

