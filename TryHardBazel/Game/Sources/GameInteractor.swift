//
//  GameInteractor.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import RxSwift
import GameInterfaces

protocol GamePresentable: Presentable {
    var listener: GamePresentableListener? { get set }
}

protocol GameRoutingInternal: GameRouting {

}

final class GameInteractor: PresentableInteractor<GamePresentable>, GameInteractable {

    weak var router: GameRoutingInternal?
    weak var listener: GameListener?

    override init(presenter: GamePresentable) {
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

// MARK: - GamePresentableListener
extension GameInteractor: GamePresentableListener {
    func dismiss(animated: Bool, point1: Int, point2: Int) {
        listener?.dismissGame(animated: animated, point1: point1, point2: point2)
    }
}
