//
//  GameBuilder.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import GameInterfaces
import UIKit

public class GameComponent: Component<GameDependency> {

}

// MARK: - Builder

public class GameBuilder: Builder<GameDependency>, GameBuildable {

    public override init(dependency: GameDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: GameListener, point1: Int, point2: Int) -> GameRouting {
        let component = GameComponent(dependency: dependency)
        let bundlePath = Bundle.main.bundlePath + "/GameResources.bundle"
        let viewController = GameViewController(nibName: nil, bundle: Bundle.init(path: bundlePath))
        viewController.point1 = point1
        viewController.point2 = point2
        
        let interactor = GameInteractor(presenter: viewController)
        interactor.listener = listener
        
        return GameRouter(interactor: interactor, viewController: viewController)
    }
}
