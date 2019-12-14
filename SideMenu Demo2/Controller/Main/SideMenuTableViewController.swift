//
//  SideMenuTableViewController.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/12/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    var delegate: SideMenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
    }
    
    func setupUIElements() {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: SideMenuTableViewCell.reuserIdentifier, bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.reuserIdentifier)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuOptions.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.reuserIdentifier, for: indexPath) as! SideMenuTableViewCell
        cell.iconImageView.image = SideMenuOptions(rawValue: indexPath.row)?.image
        cell.optionNameLabel.text = SideMenuOptions(rawValue: indexPath.row)?.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedMenuOption = SideMenuOptions(rawValue: indexPath.row) {
            delegate?.didTapMenuOption(selectedMenuOption)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
