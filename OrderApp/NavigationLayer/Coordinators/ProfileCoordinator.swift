//
//  ProfileCoordinator.swift
//  OrderApp
//
//  Created by Alexander Suprun on 11.06.2024.
//

import Foundation

class ProfileCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
