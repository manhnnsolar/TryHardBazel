//
//  HomeBuilder.swift
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

final class HomeComponent: Component<HomeDependency> {

}

// MARK: - Builder

public final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    public override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let bundlePath = Bundle.main.bundlePath + "/HomeResources.bundle"
        let viewController = HomeViewController(nibName: nil, bundle: Bundle.init(path: bundlePath))
        let interactor = HomeInteractor(presenter: viewController)
        let historyBuilder = HistoryBuilder(dependency: component)
        let gameBuilder = GameBuilder(dependency: component)
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController, historyBuilder: historyBuilder, gameBuilder: gameBuilder)
    }
}
