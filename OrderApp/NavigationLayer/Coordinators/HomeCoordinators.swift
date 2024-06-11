//
//  HomeCoordinators.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//

import Foundation

class HomeCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
