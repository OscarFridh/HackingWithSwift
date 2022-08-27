//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Oscar Fridh on 2022-08-27.
//

import Foundation

struct RockPaperScissorsGame {
    var moves = 0
    var score = 0
    var shouldWin = Bool.random()
    var appChoice = Move.random()
    var size = 10
    
    var finished: Bool {
        moves >= size
    }
    
    mutating func select(move: Move) -> Bool {
        precondition(!finished)
        
        let correct: Bool
        
        if (shouldWin && move.wins(over: appChoice)) || (!shouldWin && appChoice.wins(over: move)) {
            correct = true
        } else {
            correct = false
        }
        
        moves += 1
        score += correct ? 1 : -1
        
        shouldWin.toggle()
        appChoice = Move.random()
        
        return correct
    }
    
    mutating func restart() {
        moves = 0
        score = 0
        shouldWin = Bool.random()
        appChoice = Move.random()
    }
}

enum Move: String, CaseIterable, Identifiable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    var id: String {
        rawValue
    }
    
    func wins(over other: Move) -> Bool {
        switch (self, other) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper): return true
        default: return false
        }
    }
    
    static func random() -> Move {
        allCases.randomElement()!
    }
}
