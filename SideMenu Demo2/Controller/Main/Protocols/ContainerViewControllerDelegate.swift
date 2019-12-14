//
//  ContainerViewControllerDelegate.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/12/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation

protocol ContainerViewControllerDelegate: AnyObject {
    
    var leftDrawerDelegate: LeftDrawerViewControllerDelegate? { get set }
    
    func setNavigationFor(_ sideMenuOption: SideMenuOptions)
}

extension ContainerViewControllerDelegate {
    var leftDrawerDelegateleftDrawerDelegate: LeftDrawerViewControllerDelegate? {
       return nil
    }
}
