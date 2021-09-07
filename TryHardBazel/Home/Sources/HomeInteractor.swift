//
//  HomeInteractor.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RxSwift
import HomeInterfaces
import UIKit

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
}

protocol HomeRoutingInternal: HomeRouting {

}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

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
