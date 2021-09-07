//
//  AppDelegate.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import UIKit
import Root
import RIBs
import RootInterfaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootRouter: RootRouting!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let rootBuilder = RootBuilder(dependency: AppComponent(window: window!))
        rootRouter = rootBuilder.build()
        rootRouter.interactable.activate()
        rootRouter.load()
        return true
    }
}

