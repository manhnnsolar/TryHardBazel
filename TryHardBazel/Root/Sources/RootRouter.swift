//
//  RootRouter.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RootInterfaces
import HomeInterfaces
import UIKit
import Home

protocol RootInteractable: Interactable, HomeListener {
    var router: RootRoutingInternal? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {

}

final class RootRouter: ViewableRouter<RootInteractable, RootViewControllable>, RootRoutingInternal {
    var window: UIWindow
    var homeBuilder: HomeBuilder
    
    var homeRouter: HomeRouting?
    
    init(interactor: RootInteractable, viewController: RootViewControllable, window: UIWindow, homeBuilder: HomeBuilder) {
        self.window = window
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToHome() {
        let homeRouter = homeBuilder.build(withListener: self.interactor)
        attachChild(homeRouter)
        
        let navagation = UINavigationController(rootViewController: homeRouter.viewControllable.uiviewController)
        navagation.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navagation
        self.homeRouter = homeRouter
    }
}
