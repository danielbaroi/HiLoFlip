//
//  HiLoGame.swift
//  HiLoFlip
//
//  Created by Daniel Baroi on 10/3/24.
//

import Foundation

struct HiLoGame {
    struct Card {
        let value: Int
        var isFaceUp: Bool = true
        let isSpecialCard: Bool
        let isTenPointCard: Bool
        let isMustPlayTwoCard: Bool
        let isSkipCard: Bool
        
        init(value: Int) {
            self.value = value
            self.isSpecialCard = value % 10 == 0 || value % 10 == 1 || value % 10 == 2
            self.isTenPointCard = value % 10 == 0
            self.isMustPlayTwoCard = value % 10 == 1
            self.isSkipCard = value % 10 == 2
        }
    }
    
    struct Player {
        let name: String
        var hand: [Card] = []
        var score: Int = 0
    }
    
    var deck: [Card]
    var players: [Player]
    var isTokenHi: Bool
    
    init(playerNames: [String]) {
        self.deck = (1...100).map { Card(value: $0) }
        self.players = playerNames.map { Player(name: $0) }
        self.isTokenHi = Bool.random()
        self.dealCards()
    }
    
    mutating func dealCards() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = Array(deck.prefix(7))
            deck.removeFirst(7)
        }
    }
    
    mutating func resetGame() {
        deck = (1...100).map { Card(value: $0) }
        for i in 0..<players.count {
            players[i].hand = []
            players[i].score = 0
        }
        dealCards()
        isTokenHi = Bool.random()
    }
}
