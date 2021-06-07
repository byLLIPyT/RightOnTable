//
//  Game.swift
//  RightOnTable
//
//  Created by Александр Уткин on 06.06.2021.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    private var minValue: Int
    private var maxValue: Int
    private var lastRound: Int
    private var currentRound: Int = 1
    
    init?(startValue: Int, endValue: Int, rounds:Int) {
        
        guard startValue <= endValue else { return nil }
        
        minValue = startValue
        maxValue = endValue
        lastRound = rounds
        currentSecretValue = self.newRandomValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRound += 1
        currentSecretValue = newRandomValue()
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 + value - currentSecretValue
        } else {
            score += 50
        }
    }
    
    private func newRandomValue() -> Int {
        (minValue...maxValue).randomElement()!
    }
    
}
