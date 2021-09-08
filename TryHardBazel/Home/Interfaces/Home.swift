//
//  Home.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs

public protocol HomeDependency: Dependency {

}

public protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

public protocol HomeRouting: ViewableRouting {
    func routeToHistory(playerWin: String, point: Int)
    func dismissHistory(animated: Bool)
    func routeToGame(point1: Int, point2: Int)
    func dismissGame(animated: Bool)
}

public protocol HomeListener: AnyObject {

}
