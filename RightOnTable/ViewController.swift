//
//  ViewController.swift
//  RightOnTable
//
//  Created by Александр Уткин on 03.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 0, endValue: 50, rounds: 5)
        if let currentValue = game?.currentSecretValue {
            updateLabelText(value: currentValue)
        }
    }
        
    @IBAction func checkNumber(_ sender: Any) {

        game?.calculateScore(with: Int(slider.value))
        
        if game.isGameEnded {
            showAlert(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelText(value: game.currentSecretValue)
    }
    
    private func showAlert(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново?", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func updateLabelText(value: Int) {
        label.text = String(value)
    }
}

