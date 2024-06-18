//
//  SceneDelegate.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = OnboardingViewController()
        self.window?.makeKeyAndVisible()
    }
}

