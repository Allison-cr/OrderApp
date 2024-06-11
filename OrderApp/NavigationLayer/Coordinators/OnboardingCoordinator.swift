//
//  OnboardingCoordinator.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//

import Foundation

class OnboardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
