//
//  TabBarManager.swift
//  TabBarPOC
//
//  Created by Berezin, Eugene on 1/25/21.
//

import UIKit

class TabBarManager {
    var window: UIWindow?
    var tabItems = [TabItem]()
    
   
    init(window: UIWindow) {
        self.window = window
    }
    
    init() {}
    
    func setupRootViewControllerFromJSON() {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = getViewControllersFromJSON()
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
    
    func setupRootViewController(features: [Feature]) {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = getViewControllers(from: features)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
      }
    
     func getViewControllersFromJSON() -> [UIViewController] {
        tabItems = Bundle.main.decode(type: [TabItem].self, from: "TabBar.json")
        let viewControllers = tabItems
              .sorted { $0.order < $1.order }
              .compactMap { $0.toViewController() }
            return viewControllers
    }

       func getViewControllers(from features: [Feature]) -> [UIViewController] {
       
        for feature in features {
          switch feature {
            case .red:
                self.tabItems.append(TabItem.red)
            case .blue:
                self.tabItems.append(TabItem.blue)

            case .yellow:
                self.tabItems.append(TabItem.yellow)

            case .cyan:
                self.tabItems.append(TabItem.cyan)
          }
        }
        
        let viewControllers = tabItems
              .sorted { $0.order < $1.order }
              .compactMap { $0.toViewController() }
            return viewControllers
      }

    
}
