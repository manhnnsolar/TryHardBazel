//
//  HomeRouter.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import HomeInterfaces
import UIKit

protocol HomeInteractable: Interactable {
    var router: HomeRoutingInternal? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {

}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRoutingInternal {

    override init(interactor: HomeInteractable, viewController: HomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
