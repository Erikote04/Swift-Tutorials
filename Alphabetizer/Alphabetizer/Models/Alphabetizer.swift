//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by Erik Sebastian de Erice Jerez on 2/6/25.
//

import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions
    
    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // TODO: Implement submit
        score += 1
    }
    
    // MARK: private implementation
    
    /// updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        
        for word in newWords {
            tiles.append(Tile(word: word))
        }
    }
}
