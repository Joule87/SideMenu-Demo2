//
//  FavoritesViewController.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/13/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class FavoritesViewController: TabBarBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapSideMenu(_ sender: UIBarButtonItem) {
        leftDrawerDelegate?.didTapHamburguerMenuButton()
    }
    
}
