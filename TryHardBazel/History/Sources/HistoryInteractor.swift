//
//  HistoryInteractor.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import RxSwift
import HistoryInterfaces

protocol HistoryPresentable: Presentable {
    var listener: HistoryPresentableListener? { get set }
}

protocol HistoryRoutingInternal: HistoryRouting {

}

final class HistoryInteractor: PresentableInteractor<HistoryPresentable>, HistoryInteractable {

    weak var router: HistoryRoutingInternal?
    weak var listener: HistoryListener?

    override init(presenter: HistoryPresentable) {
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

// MARK: - HistoryPresentableListener
extension HistoryInteractor: HistoryPresentableListener {
    func dismiss(animated: Bool) {
        listener?.dismissHistory(animated: animated)
    }
    
    func resetData() {
        listener?.resetData()
    }
}
