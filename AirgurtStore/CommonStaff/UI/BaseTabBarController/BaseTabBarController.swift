//
//  BaseTabBarController.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchModule = SearchModule()
        let appsModule = AppsModule()

        viewControllers = [createNavController(viewController: appsModule.viewController,
                                               title: "Today",
                                               imageName: "newspaper.fill"),
                           createNavController(viewController: UIViewController(),
                                               title: "Apps",
                                               imageName: "square.stack.3d.up.fill"),
                           createNavController(viewController: searchModule.viewController,
                                               title: "Search",
                                               imageName: "magnifyingglass")
                           ]
    }
    
    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        navigationController.tabBarItem.title = title
        return navigationController
    }
}
