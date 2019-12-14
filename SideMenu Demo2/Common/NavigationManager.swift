//
//  NavigationManager.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/13/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

struct NavigationManager {
    
    func presentViewController(for menuOption: SideMenuOptions, from viewController: UIViewController) {
        var storyBoard: UIStoryboard?
        var nextViewController: UIViewController?
        switch menuOption {
        case .Profile:
            storyBoard = UIStoryboard(name: Constants.StoryboardName.Profile, bundle: nil)
            nextViewController = storyBoard?.instantiateInitialViewController()
        case .Notifications:
            storyBoard = UIStoryboard(name: Constants.StoryboardName.Notifications, bundle: nil)
            nextViewController = storyBoard?.instantiateInitialViewController()
        case .Settings:
            storyBoard = UIStoryboard(name: Constants.StoryboardName.Settings, bundle: nil)
            nextViewController = storyBoard?.instantiateInitialViewController()
        case .Gallery:
            storyBoard = UIStoryboard(name: Constants.StoryboardName.Gallery, bundle: nil)
            nextViewController = storyBoard?.instantiateInitialViewController()
        case .Inbox:
            storyBoard = UIStoryboard(name: Constants.StoryboardName.Inbox, bundle: nil)
            nextViewController = storyBoard?.instantiateInitialViewController()
        case .OnlineHelp:
            storyBoard = UIStoryboard(name: Constants.StoryboardName.OnlineHelp, bundle: nil)
            nextViewController = storyBoard?.instantiateInitialViewController()
        case .Logout:
            break
        }
        if let vc = nextViewController {
            viewController.present(vc, animated: true)
        }
    }
}
