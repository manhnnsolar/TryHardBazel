//
//  AppDelegate.swift
//  TryHardBazel
//
//  Created by Manh Nguyen Ngoc on 04/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateInitialViewController()
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        return true
    }
}

