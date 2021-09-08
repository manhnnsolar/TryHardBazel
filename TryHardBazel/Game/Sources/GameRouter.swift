//
//  GameRouter.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import GameInterfaces

protocol GameInteractable: Interactable {
    var router: GameRoutingInternal? { get set }
    var listener: GameListener? { get set }
}

protocol GameViewControllable: ViewControllable {

}

final class GameRouter: ViewableRouter<GameInteractable, GameViewControllable>, GameRoutingInternal {

    override init(interactor: GameInteractable, viewController: GameViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
