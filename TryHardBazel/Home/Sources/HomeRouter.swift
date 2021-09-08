//
//  HomeRouter.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import HomeInterfaces
import HistoryInterfaces
import GameInterfaces
import UIKit
import History
import Game

protocol HomeInteractable: Interactable, HistoryListener, GameListener {
    var router: HomeRoutingInternal? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {

}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRoutingInternal {
    var historyBuilder: HistoryBuildable
    var historyRooting: HistoryRouting?
    var gameBuilder: GameBuildable
    var gameRooting: GameRouting?
    
    init(interactor: HomeInteractable, viewController: HomeViewControllable, historyBuilder: HistoryBuildable, gameBuilder: GameBuildable) {
        self.historyBuilder = historyBuilder
        self.gameBuilder = gameBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

// MARK: - HomeRouting
extension HomeRouter: HomeRouting {
    func routeToGame(point1: Int, point2: Int) {
        let gameRouter = gameBuilder.build(withListener: interactor, point1: point1, point2: point2)
        attachChild(gameRouter)
        
        self.viewController.uiviewController.navigationController?.pushViewController(gameRouter.viewControllable.uiviewController, animated: true)
        self.gameRooting = gameRouter
    }
    
    func dismissGame(animated: Bool) {
        guard let routing = gameRooting else {
            return
        }
        
        self.viewControllable.uiviewController.navigationController?.popViewController(animated: animated)
        self.detachChild(routing)
        self.gameRooting = nil
    }
    
    func routeToHistory(playerWin: String, point: Int) {
        let historyRouter = historyBuilder.build(withListener: interactor, playerWin: playerWin, point: point)
        attachChild(historyRouter)
        
        self.viewController.uiviewController.navigationController?.pushViewController(historyRouter.viewControllable.uiviewController, animated: true)
        
        self.historyRooting = historyRouter
    }
    
    func dismissHistory(animated: Bool) {
        guard let routing = historyRooting else {
            return
        }
        
        self.viewControllable.uiviewController.navigationController?.popViewController(animated: animated)
        detachChild(routing)
        self.historyRooting = nil
    }
}
