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

}

public protocol HomeListener: AnyObject {

}
