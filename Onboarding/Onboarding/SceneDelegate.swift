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
        
        let vc = self.isOnboardingComplete()
        self.setupViewController(with: vc)
        self.window?.makeKeyAndVisible()
    }
    
    func isOnboardingComplete() -> UIViewController {
        if let isOnboardingComplete = UserDefaultsManager.shared.getBool(forKey: UserDefaultsKey.isOnboardingComplete), isOnboardingComplete {
            return MenuViewController()
        } else {
            return OnboardingViewController()
        }
    }
    
    func setupViewController(with viewController: UIViewController) {
        let navController = UINavigationController(rootViewController: viewController)
        navController.isNavigationBarHidden = true
        
        // TODO: - ERROR IF UNCOMMNET
        self.window?.rootViewController = navController
        
//        self.window?.rootViewController = OnboardingViewController()
    }
}


