//
//  TabBarManager.swift
//  TabBarPOC
//
//  Created by Berezin, Eugene on 1/25/21.
//

import UIKit

class TabBarManager {
    var window: UIWindow?
   
    init(window: UIWindow) {
        self.window = window
    }
    
    func setupRootViewController(features: [Feature]) {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = getViewControllers(from: features)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
      }

      private func getViewControllers(from features: [Feature]) -> [UIViewController] {
        var tabItems = [TabItem]()
        
        for feature in features {
          switch feature {
            case .red:
                tabItems.append(TabItem.red)
            case .blue:
                tabItems.append(TabItem.blue)

            case .yellow:
                tabItems.append(TabItem.yellow)

            case .cyan:
                tabItems.append(TabItem.cyan)
          }
        }
        
        let viewControllers = tabItems
              .sorted { $0.order < $1.order }
              .compactMap { $0.toViewController() }
            return viewControllers
      }

    
}
