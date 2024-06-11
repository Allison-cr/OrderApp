//
//  OrderCoordinator.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//

import Foundation

class OrderCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .cyan
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
