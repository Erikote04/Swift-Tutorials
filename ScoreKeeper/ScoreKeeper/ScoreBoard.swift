//
//  ScoreBoard.swift
//  ScoreKeeper
//
//  Created by Erik Sebastian de Erice Jerez on 29/5/25.
//

import Foundation

struct ScoreBoard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]
    
    var state: GameState = .setup
    var doesHighestScoreWin: Bool = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = doesHighestScoreWin ? Int.min : Int.max
        
        for player in players {
            winningScore = doesHighestScoreWin ? max(player.score, winningScore) : min(player.score, winningScore)
        }
        
        return players.filter { $0.score == winningScore }
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
