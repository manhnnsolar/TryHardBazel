//
//  RootBuilder.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RootInterfaces
import HomeInterfaces
import UIKit
import Home

final class RootComponent: Component<RootDependency>, HomeDependency {

}

// MARK: - Builder

public final class RootBuilder: Builder<RootDependency>, RootBuildable {

    public override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    public func build() -> RootRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let homeBuilder = HomeBuilder(dependency: component)
        return RootRouter(interactor: interactor, viewController: viewController, window: dependency.window, homeBuilder: homeBuilder)
    }
}
