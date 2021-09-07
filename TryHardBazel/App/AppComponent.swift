//
//  AppComponent.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import Foundation
import UIKit
import RIBs
import RootInterfaces

class AppComponent: Component<EmptyComponent>, RootDependency {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init(dependency: EmptyComponent())
    }
}

