//
//  HomeInteractor.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RxSwift
import HomeInterfaces
import HistoryInterfaces
import GameInterfaces
import UIKit

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
    func resetData()
    func swapData(point1: Int, point2: Int)
}

protocol HomeRoutingInternal: HomeRouting {

}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {

    weak var router: HomeRoutingInternal?
    weak var listener: HomeListener?

    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: - HomePresentableListener
extension HomeInteractor: HomePresentableListener {
    func routeToGame(point1: Int, point2: Int) {
        router?.routeToGame(point1: point1, point2: point2)
    }
    
    func routeToHistory(playerWin: String, point: Int) {
        router?.routeToHistory(playerWin: playerWin, point: point)
    }
}

// MARK: - HistoryListener
extension HomeInteractor: HistoryListener {
    func resetData() {
        presenter.resetData()
        router?.dismissHistory(animated: true)
    }
    
    func dismissHistory(animated: Bool) {
        router?.dismissHistory(animated: animated)
    }
}

// MARK: - GameListener
extension HomeInteractor: GameListener {
    func dismissGame(animated: Bool, point1: Int, point2: Int) {
        presenter.swapData(point1: point1, point2: point2)
        router?.dismissGame(animated: animated)
    }
}

