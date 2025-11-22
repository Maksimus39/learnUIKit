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
        
        //1
        guard let scene = (scene as? UIWindowScene) else { return }
        
        //2
        self.window = UIWindow(windowScene: scene)
        
        //3
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        
        //4
        self.window?.makeKeyAndVisible()
    }
}

