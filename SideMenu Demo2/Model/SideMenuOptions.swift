//
//  SideMenuOptions.swift
//  SideMenu Demo2
//
//  Created by Julio Collado on 12/12/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

enum SideMenuOptions: Int, CaseIterable {
    case Profile, Notifications, Settings, Gallery, Inbox, OnlineHelp, Logout
    
    var description: String {
        switch self {
        case .Profile:
            return "Profile"
        case .Notifications:
            return "Notifications"
        case .Settings:
            return "Settings"
        case .Gallery:
            return "Gallery"
        case .Inbox:
            return "Inbox"
        case .OnlineHelp:
            return "Online Help"
        case .Logout:
            return "Logout"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile:
            return #imageLiteral(resourceName: "profile")
        case .Notifications:
            return #imageLiteral(resourceName: "notifications")
        case .Settings:
            return #imageLiteral(resourceName: "settings")
        case .Gallery:
            return #imageLiteral(resourceName: "gallery")
        case .Inbox:
            return #imageLiteral(resourceName: "Inbox")
        case .OnlineHelp:
            return #imageLiteral(resourceName: "online support")
        case .Logout:
            return #imageLiteral(resourceName: "logout")
        }
    }
}
