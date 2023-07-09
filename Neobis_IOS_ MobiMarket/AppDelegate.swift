//
//  AppDelegate.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController:
                                                                LoginViewController(loginProtocol: LoginViewModel()))
        
        window?.makeKeyAndVisible()
        return true
    }

}

