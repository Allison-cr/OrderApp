//
//  TabBarController.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//
import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarController: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarController {
            self.addChild(tab)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init has not be implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .gray
        tabBar.tintColor = .purple
    }
    
}
