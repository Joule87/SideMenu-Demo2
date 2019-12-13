//
//  ChartViewController.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/13/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    var leftDrawerDelegate: LeftDrawerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSideMenu(_ sender: UIBarButtonItem) {
        leftDrawerDelegate?.didTapHamburguerMenuButton()
    }
}

extension ChartViewController: ContainerViewControllerDelegate {
    func setNavigationFor(_ sideMenuOption: SideMenuOptions) {
        print(sideMenuOption.description ?? "")
    }
}
