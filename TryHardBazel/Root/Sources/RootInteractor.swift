//
//  RootInteractor.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RxSwift
import RootInterfaces
import HomeInterfaces

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootRoutingInternal: RootRouting {
    func routeToHome()
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRoutingInternal?
    weak var listener: RootListener?

    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.routeToHome()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
