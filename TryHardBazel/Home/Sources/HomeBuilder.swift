//
//  HomeBuilder.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import HomeInterfaces
import UIKit

public class HomeComponent: Component<HomeDependency> {

}

// MARK: - Builder

public class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    public override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: HomeListener) -> HomeRouting {
        // let component = HomeComponent(dependency: dependency)
        let bundlePath = Bundle.main.bundlePath + "/HomeResources.bundle"
        print(bundlePath)
        let viewController = HomeViewController(nibName: nil, bundle: Bundle.init(path: bundlePath))
        let interactor = HomeInteractor(presenter: viewController)
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
