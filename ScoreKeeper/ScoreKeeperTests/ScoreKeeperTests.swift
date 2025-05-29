//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Erik Sebastian de Erice Jerez on 29/5/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = ScoreBoard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
}
