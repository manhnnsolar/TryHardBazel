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
import HistoryInterfaces
import GameInterfaces

protocol HomePresentableListener: AnyObject {
    func routeToHistory(playerWin: String, point: Int)
    func routeToGame(point1: Int, point2: Int)
}

final class HomeViewController: UIViewController, HomeViewControllable {

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
        let playerWin = point1 < point2 ? "Player2" : "Player1"
        listener?.routeToHistory(playerWin: playerWin, point: max(point1, point2))
    }
    
    @IBAction func routeToGameDidTap(_ sender: Any) {
        listener?.routeToGame(point1: point1, point2: point2)
    }
}

// MARK: - HomePresentable
extension HomeViewController: HomePresentable {
    func swapData(point1: Int, point2: Int) {
        self.point1 = point1
        self.point2 = point2
        player1.text = "\(point1)"
        player2.text = "\(point2)"
    }
    
    func resetData() {
        point1 = 0
        point2 = 0
        player1.text = "\(point1)"
        player2.text = "\(point2)"
    }
}

