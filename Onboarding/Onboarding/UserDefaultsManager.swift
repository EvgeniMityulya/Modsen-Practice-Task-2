//
//  UserDefaultsManager.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/20/24.
//

import Foundation

enum UserDefaultsKey: String {
    case isOnboardingComplete = "isOnboardingComplete"
}

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() {
        self.registerDefaults()
    }
    
    private let defaults = UserDefaults.standard
    
    func save(_ value: Bool, forKey key: UserDefaultsKey) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func getBool(forKey key: UserDefaultsKey) -> Bool? {
        return defaults.bool(forKey: key.rawValue)
    }
}

private extension UserDefaultsManager {
    func registerDefaults() {
        let defaultValues: [String: Any] = [
            UserDefaultsKey.isOnboardingComplete.rawValue: false
        ]
        defaults.register(defaults: defaultValues)
    }
}
