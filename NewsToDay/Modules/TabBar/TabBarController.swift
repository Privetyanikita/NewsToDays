//
//  TabBarController.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 19.03.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    
    //MARK: - Lifecycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 12
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupTabBar()
    }
}


//MARK: - Private Methods

private extension TabBarController {
    func configure() {
        tabBar.tintColor = .purplePrimary
        tabBar.unselectedItemTintColor = .greyLight
        tabBar.layer.borderColor = UIColor.greyLight.cgColor
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.masksToBounds = true
        
        if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .white
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
            }
    }

    
    func createNavController(vc: UIViewController, titleVC: String, itemImage: UIImage, tag: Int) -> UINavigationController {
        
        vc.title = titleVC
        
        let item = UITabBarItem(title: nil,
                                image: itemImage,
                                tag: tag)
        item.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
    
    
    func setupTabBar() {
        let homeVC = createNavController(vc: HomeViewController(), titleVC: "Browse", itemImage: .homeIcon, tag: 0)
        let categoriesVC = createNavController(vc: CategoriesViewController(), titleVC: "Categories", itemImage: .categoriesIcon, tag: 1)
        let bookmarksVC = createNavController(vc: BookmarksViewController(), titleVC: "Bookmarks", itemImage: .bookmarkIcon, tag: 2)
        let profileVC = createNavController(vc: ProfilelViewController(), titleVC: "Profile", itemImage: .profileIcon, tag: 3)
        
        setViewControllers([homeVC,
                            categoriesVC,
                            bookmarksVC,
                            profileVC], animated: true)
        
    }
}
