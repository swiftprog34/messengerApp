//
//  TabBarViewController.swift
//  socialMVP
//
//  Created by Виталий Емельянов on 14.11.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .systemBackground
        
        let customVC = UIViewController()
        customVC.tabBarItem = UITabBarItem(title: "Log out", image: UIImage(systemName: "square.and.arrow.up.circle"), tag: 4)

        self.viewControllers = [
            createNavController(for: ProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.circle")!),
            createNavController(for: UsersViewController(), title: NSLocalizedString("Users", comment: ""), image: UIImage(systemName: "person.2.circle")!),
            createNavController(for: MessagesViewController(), title: NSLocalizedString("Messages", comment: ""), image: UIImage(systemName: "message.circle")!),
            customVC
        ]
    }
    
    func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.backgroundColor = .systemBackground
        rootViewController.navigationItem.title = title
        return navController
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 4 {
            let presentationViewController = AuthViewController()
            presentationViewController.modalPresentationStyle = .fullScreen
            present(presentationViewController, animated: true, completion: nil)
        }
    }

}
