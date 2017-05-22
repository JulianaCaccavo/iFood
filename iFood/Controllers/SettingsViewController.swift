//
//  SettingsViewController.swift
//  iFood
//
//  Created by Matias Fernandez on 08/05/2017.
//  Copyright © 2017 Acamica. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2
        self.imageView.layer.masksToBounds = true
    }
    
}
