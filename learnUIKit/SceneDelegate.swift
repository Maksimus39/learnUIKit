//
//  SceneDelegate.swift
//  learnUIKit
//
//  Created by Максим Минаков on 14.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene)
        
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        
        self.window?.makeKeyAndVisible()
    }
}

