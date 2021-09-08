//
//  HistoryRouter.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import HistoryInterfaces

protocol HistoryInteractable: Interactable {
    var router: HistoryRoutingInternal? { get set }
    var listener: HistoryListener? { get set }
}

protocol HistoryViewControllable: ViewControllable {

}

final class HistoryRouter: ViewableRouter<HistoryInteractable, HistoryViewControllable>, HistoryRoutingInternal {

    override init(interactor: HistoryInteractable, viewController: HistoryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
