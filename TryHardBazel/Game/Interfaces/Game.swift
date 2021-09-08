//
//  Game.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs

public protocol GameDependency: Dependency {

}

public protocol GameBuildable: Buildable {
    func build(withListener listener: GameListener, point1: Int, point2: Int) -> GameRouting
}

public protocol GameRouting: ViewableRouting {

}

public protocol GameListener: AnyObject {
    func dismissGame(animated: Bool, point1: Int, point2: Int)
}
