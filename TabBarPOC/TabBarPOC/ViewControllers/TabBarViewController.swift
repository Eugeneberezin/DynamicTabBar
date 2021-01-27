//
//  TabBarViewController.swift
//  TabBarPOC
//
//  Created by Berezin, Eugene on 1/26/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    var tabItems = [TabItem]()
    let tabBarManager = TabBarManager()

    override func viewDidLoad() {
        super.viewDidLoad()
//        viewControllers = tabBarManager.getViewControllersFromJSON()
        viewControllers = tabBarManager.getViewControllers(from: [.red, .yellow, .cyan])
    }
    
}
