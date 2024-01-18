//
//  SceneDelegate.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windwScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windwScene)
        
        let naviVC = UINavigationController(rootViewController: ContactViewController())
        
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    
    func sceneDidBecomeActive(_ scene: UIScene) { }
    
    func sceneWillResignActive(_ scene: UIScene) { }
    
    func sceneWillEnterForeground(_ scene: UIScene) { }
    
    func sceneDidEnterBackground(_ scene: UIScene) { }
    
}

