//
//  Coordinator.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//

import Foundation

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinatro: CoordinatorProtocol)
}

protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController? { get set }
}

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](),
         type: CoordinatorType,
         navigationController: UINavigationController,
         finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("coordinator deinit \(type)")
        childCoordinators.forEach{ $0.finishDelegate }
        childCoordinators.removeAll()
    }
    
    func start() {
        print("coordinator start")
    }
    
    func finish() {
        print("coordinator finish")
    }
    
}
