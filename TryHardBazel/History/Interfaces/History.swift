//
//  History.swift
//  App-App_Classes
//
//  Created by Manh Nguyen Ngoc on 08/09/2021.
//

import RIBs

public protocol HistoryDependency: Dependency {

}

public protocol HistoryBuildable: Buildable {
    func build(withListener listener: HistoryListener, playerWin: String, point: Int) -> HistoryRouting
}

public protocol HistoryRouting: ViewableRouting {

}

public protocol HistoryListener: AnyObject {
    func dismissHistory(animated: Bool)
    func resetData()
}
