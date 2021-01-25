//
//  TabBarItem.swift
//  TabBarPOC
//
//  Created by Berezin, Eugene on 1/25/21.
//

import UIKit

struct TabItem {
    let storyboardName: String
    let controllerName: String
    let image: String
    let selectedImage: String
    let order: Int
    let title: String
    
    static let red = TabItem(
        storyboardName: "Main",
        controllerName: "red",
        image: "star.fill",
        selectedImage: "star.fill",
        order: 3,
        title: "Red"
    )
    static let blue = TabItem(
        storyboardName: "Main",
        controllerName: "blue",
        image: "flag.fill",
        selectedImage: "flag.fill",
        order: 0,
        title: "Blue"
        
    )
    
    static let yellow = TabItem(
        storyboardName: "Main",
        controllerName: "yellow",
        image: "cart.badge.plus",
        selectedImage: "cart.badge.plus",
        order: 1,
        title: "Yellow"
    )
    
    static let cyan = TabItem(
        storyboardName: "Main",
        controllerName: "cyan",
        image: "leaf.fill",
        selectedImage: "leaf.fill",
        order: 2,
        title: "Cyan"
    )
    
    func toViewController() -> UIViewController {
        let tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: image),
            selectedImage: UIImage(systemName: selectedImage)
        )
        tabBarItem.tag = order
        
        let viewController = UIStoryboard(name: storyboardName, bundle: Bundle(path: "TabBarPOC"))
            .instantiateViewController(withIdentifier: controllerName)
        viewController.tabBarItem = tabBarItem
        return viewController
    }
}
