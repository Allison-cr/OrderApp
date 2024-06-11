//
//  AppCoordinator.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
 
//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingController = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        onboardingController.start()
        addChildCoordinator(onboardingController)
        onboardingController.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "home", image: UIImage.init(systemName: "home"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .home, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "order", image: UIImage.init(systemName: "home"), tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .home, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "list", image: UIImage.init(systemName: "home"), tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .home, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "profile", image: UIImage.init(systemName: "home"), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarController: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinatro: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatro)
        
        switch childCoordinatro.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
