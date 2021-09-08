//
//  HistoryBuilder.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import HistoryInterfaces
import UIKit

public class HistoryComponent: Component<HistoryDependency> {

}

// MARK: - Builder

public class HistoryBuilder: Builder<HistoryDependency>, HistoryBuildable {

    public override init(dependency: HistoryDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: HistoryListener, playerWin: String, point: Int) -> HistoryRouting {
        let component = HistoryComponent(dependency: dependency)
        let bundlePath = Bundle.main.bundlePath + "/HistoryResources.bundle"
        let viewController = HistoryViewController(nibName: nil, bundle: Bundle.init(path: bundlePath))
        viewController.titlePlayer = playerWin
        viewController.pointPlayer = point
        
        let interactor = HistoryInteractor(presenter: viewController)
        interactor.listener = listener
        
        return HistoryRouter(interactor: interactor, viewController: viewController)
    }
}
