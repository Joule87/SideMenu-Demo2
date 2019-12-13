//
//  ViewController.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/12/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var sideMenuContrainerView: UIView!
    @IBOutlet weak var centralContainerView: UIView!
    @IBOutlet weak var leadingSideMenuConstraint: NSLayoutConstraint!
    
    var isSideMenuHidden = false
    
    weak var delegate: ContainerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func toggleSideMenu() {
        isSideMenuHidden = !isSideMenuHidden
        if isSideMenuHidden {
            leadingSideMenuConstraint.constant = 0
        } else {
            leadingSideMenuConstraint.constant = -301
        }
        let dampingValue = isSideMenuHidden ? CGFloat(0.7) : CGFloat(1)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: dampingValue, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    ///Set delegates when initializes the navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TabBarSegue",let tabBarViewController = segue.destination as? UITabBarController{
            tabBarViewController.delegate = self
            tabBarViewController.viewControllers?.forEach { vc in
                let navigationController = vc as? UINavigationController
                let topViewController = navigationController?.topViewController as? ContainerViewControllerDelegate
                topViewController?.leftDrawerDelegate = self
                if let home = topViewController as? HomeViewController {
                    delegate = home
                }
            }
        }
        if segue.identifier == "SideMenuSegue",
            let sideMenuViewController = segue.destination as? SideMenuTableViewController{
            sideMenuViewController.delegate = self
        }
    }
    
}

extension ContainerViewController: LeftDrawerViewControllerDelegate {
    func didTapHamburguerMenuButton() {
        self.toggleSideMenu()
    }
    
}

extension ContainerViewController: SideMenuViewControllerDelegate {
    func didTapMenuOption(_ menuOption: SideMenuOptions) {
        delegate?.setNavigationFor(menuOption)
        toggleSideMenu()
    }
    
}

extension ContainerViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navigationController = viewController as? UINavigationController,
            let vc = navigationController.topViewController as? ContainerViewControllerDelegate else { return }
        ///set the delegate for the hamburguer menu in the View Controller for the Tab Bar Item was tapped
        delegate = vc
    }
    
}
