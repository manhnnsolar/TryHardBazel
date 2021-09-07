//
//  RootViewController.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RxSwift
import UIKit
import HomeInterfaces
import RootInterfaces

protocol RootPresentableListener: AnyObject {

}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
}
