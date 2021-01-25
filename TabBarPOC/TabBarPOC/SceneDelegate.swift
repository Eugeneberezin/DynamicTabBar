//
//  SceneDelegate.swift
//  TabBarPOC
//
//  Created by Berezin, Eugene on 1/25/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupRootViewController(features: [.yellow, .cyan, .blue])

    }
    func setupRootViewController(features: [Feature]) {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = getViewControllers(from: features)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
      }

      func getViewControllers(from features: [Feature]) -> [UIViewController] {
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

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

