//
//  MenuListViewController.swift
//  iFood
//
//  Created by Matias Fernandez on 08/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class MenuListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    // Esto debe estar en una layer de networking, veremos como trabajar con esta arquitectura mas adelante
    func remoteCall() {
        
        self.indicatorView?.isHidden = false
        
        let url = URL(string: "https://api.myjson.com/bins/1essw")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        unowned let this = self
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            DispatchQueue.main.async {
                this.indicatorView?.isHidden = true
            }
            
            if error != nil {
                //Devolver un error
                return
            }
            
            guard let responseData = data else {
                //Devolver un error
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: responseData, options: []) as! [Any]
                
                this.serviceDidRespond(json)
                
            }
            catch {
                //Devolver un error
                return
            }
            
        }
        
        task.resume()
        
    }
    
    func serviceDidRespond(_ json: [Any]) {
        
        DispatchQueue.main.async {
            self.foods = [Food]()
            
            for obj in json  {
                let food = Food(obj as! [String : Any])
                self.foods.append(food)
            }
            self.tableView?.reloadData()
        }
        
    }
    
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


