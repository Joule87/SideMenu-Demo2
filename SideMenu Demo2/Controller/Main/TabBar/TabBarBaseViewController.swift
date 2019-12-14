//
//  TabBarBaseViewController.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/14/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class TabBarBaseViewController: UIViewController {
    
    var leftDrawerDelegate: LeftDrawerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension TabBarBaseViewController: ContainerViewControllerDelegate {
    func setNavigationFor(_ sideMenuOption: SideMenuOptions) {
        let navigationManager = NavigationManager()
        navigationManager.presentViewController(for: sideMenuOption, from: self)
    }
}
