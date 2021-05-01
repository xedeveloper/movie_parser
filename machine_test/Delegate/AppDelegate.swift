//
//  AppDelegate.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: FirstViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

