//
//  HomeComponent+Game.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs
import GameInterfaces

/// The dependencies needed from the parent scope of Home to provide for the Game scope.
// TODO: Update HomeDependency protocol to inherit this protocol.
public protocol HomeDependencyGame: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Home to provide dependencies
    // for the Game scope.
}

extension HomeComponent: GameDependency {

    // TODO: Implement properties to provide for Game scope.
}
