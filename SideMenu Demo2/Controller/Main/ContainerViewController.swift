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
        setupUIElements()
    }
    
    func setupUIElements() {
        guard let nav = centralContainerView.next as? UINavigationController else { return }
        if let vc = nav.viewControllers.first as? HomeViewController {
            vc.delegate = self
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NavigationSegue",
            let navigationController = segue.destination as? UINavigationController,
            let homeViewController = navigationController.viewControllers.first as? HomeViewController{
            homeViewController.delegate = self
            delegate = homeViewController
        }
        if segue.identifier == "SideMenuSegue",
            let sideMenuViewController = segue.destination as? SideMenuTableViewController{
            sideMenuViewController.delegate = self
        }
    }
    
}

extension ContainerViewController: HomeViewControllerDelegate {
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
