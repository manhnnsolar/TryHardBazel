//
//  HomeViewController.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 07/09/2021.
//

import RIBs
import RxSwift
import UIKit
import HomeInterfaces

protocol HomePresentableListener: AnyObject {

}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    var point1 = 0
    var point2 = 0
    
    weak var listener: HomePresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(":))))")
    }
    
    @IBAction func randomWinnerDidTap(_ sender: Any) {
        let random = Int.random(in: 0...1)
        if random == 0 {
            point1 += 1
        } else {
            point2 += 1
        }
        
        player1.text = "\(point1)"
        player2.text = "\(point2)"
    }
    
    @IBAction func routeToHistoryDidTap(_ sender: Any) {
        
    }
    
    @IBAction func routeToGameDidTap(_ sender: Any) {
        
    }
}
