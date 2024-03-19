//
//  TabBarController.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 19.03.2024.
//

import UIKit


//MARK: - Tabs

enum Tabs: Int {
    case home
    case categories
    case bookmarks
    case profile
}


final class TabBarController: UITabBarController {
    
    
    //MARK: - Lifecycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 12
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private Methods
    
    private func configure() {
        tabBar.tintColor = .purplePrimary
        tabBar.barTintColor = .greyLight
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.greyLight.cgColor
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.masksToBounds = true
        
        let homeNavigation = UINavigationController(rootViewController: HomeViewController())
        let categoriesNavigation = UINavigationController(rootViewController: CategoriesViewController())
        let bookmarksNavigation = UINavigationController(rootViewController: BookmarksViewController())
        let profileNavigation = UINavigationController(rootViewController: ProfilelViewController())
        
        homeNavigation.tabBarItem = UITabBarItem(title: nil, image: .home.withBaselineOffset(fromBottom: UIFont.systemFontSize / 2), tag: Tabs.home.rawValue)
        categoriesNavigation.tabBarItem = UITabBarItem(title: nil, image: .categories.withBaselineOffset(fromBottom: UIFont.systemFontSize / 2), tag: Tabs.categories.rawValue)
        bookmarksNavigation.tabBarItem = UITabBarItem(title: nil, image: .bookmark.withBaselineOffset(fromBottom: UIFont.systemFontSize / 2), tag: Tabs.bookmarks.rawValue)
        profileNavigation.tabBarItem = UITabBarItem(title: nil, image: .profile.withBaselineOffset(fromBottom: UIFont.systemFontSize / 2), tag: Tabs.profile.rawValue)
        
        setViewControllers([homeNavigation,
                           categoriesNavigation,
                           bookmarksNavigation,
                           profileNavigation], animated: true)
    }
}
