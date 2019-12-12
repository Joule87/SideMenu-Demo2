//
//  HomeViewController.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/12/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSideMenu(_ sender: UIBarButtonItem) {
        delegate?.didTapHamburguerMenuButton()
    }
    
}
extension HomeViewController: ContainerViewControllerDelegate {
    func setNavigationFor(_ sideMenuOption: SideMenuOptions) {
        print(sideMenuOption.description ?? "")
    }
    
    
}
