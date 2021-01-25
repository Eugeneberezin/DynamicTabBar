//
//  TabBarItem.swift
//  TabBarPOC
//
//  Created by Berezin, Eugene on 1/25/21.
//

import UIKit

struct TabItem {
  let viewController: UIViewController
  let image: String
  let selectedImage: String
  let order: Int

  static let red = TabItem(
    viewController: RedViewController(),
    image: "star.fill",
    selectedImage: "star.fill",
    order: 3
  )
  static let blue = TabItem(
    viewController: BlueViewController(),
    image: "flag.fill",
    selectedImage: "flag.fill",
    order: 0)
    
  static let yellow = TabItem(
    viewController: YellowViewController(),
    image: "cart.badge.plus",
    selectedImage: "cart.badge.plus",
    order: 1)
    
  static let cyan = TabItem(
    viewController: CayanViewController(),
    image: "leaf.fill",
    selectedImage: "leaf.fill",
    order: 2)
    
    func toViewController() -> UIViewController {
        let tabBarItem = UITabBarItem(
          title: nil,
          image: UIImage(systemName: image),
          selectedImage: UIImage(systemName: selectedImage)
        )
        tabBarItem.tag = order

        let viewController = self.viewController
        viewController.tabBarItem = tabBarItem
        return viewController
      }
}
