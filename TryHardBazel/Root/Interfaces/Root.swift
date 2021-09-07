//
//  Root.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import UIKit

public protocol RootDependency: Dependency {
    var window: UIWindow { get }
}

public protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

public protocol RootRouting: ViewableRouting {

}

public protocol RootListener: AnyObject {

}
