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
        //self.window?.rootViewController = isOnboardingComplete()
        self.window?.rootViewController = OnboardingViewController()
        self.window?.makeKeyAndVisible()
    }
    
    func isOnboardingComplete() -> UIViewController {
        if let isOnboardingComplete = UserDefaultsManager.shared.getBool(forKey: UserDefaultsKey.isOnboardingComplete) {
            MenuViewController()
        } else {
            OnboardingViewController()
        }
    }
        
    func goToMenu() {
        let menuViewController = MenuViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        guard let window = self.window else { return }
        window.addSubview(menuViewController.view)
        menuViewController.view.frame = CGRect(x: window.frame.width, y: 0, width: window.frame.width, height: window.frame.height)
        UIView.animate(withDuration: 0.25, animations: {
            menuViewController.view.frame = window.frame
            window.rootViewController?.view.frame = CGRect(x: -window.frame.width, y: 0, width: window.frame.width, height: window.frame.height)
        }) { _ in
            window.rootViewController = menuViewController
        }
    }
}


